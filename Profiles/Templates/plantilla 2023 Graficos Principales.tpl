<chart>
id=133185534725628857
symbol=USDCAD
description=US Dollar vs Canadian Dollar
period_type=1
period_size=1
digits=5
tick_size=0.000000
position_time=1674471600
scale_fix=0
scale_fixed_min=1.330200
scale_fixed_max=1.343100
scale_fix11=0
scale_bar=0
scale_bar_val=1.000000
scale=8
mode=1
fore=0
grid=0
volume=0
scroll=0
shift=1
shift_size=9.476662
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
window_right=778
window_bottom=888
window_type=1
floating=0
floating_left=219
floating_top=140
floating_right=998
floating_bottom=1000
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
objects=1298

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
type=101
name=VelasRSI1673542800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1673535600
value1=1.334800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1672722000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1672714800
value1=1.362720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1672167600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1672160400
value1=1.349260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1671123600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1671116400
value1=1.363520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1670518800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1670511600
value1=1.356310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1670335200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1670328000
value1=1.363960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1670328000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1670320800
value1=1.362420
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
value1=1.365380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1669680000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1669672800
value1=1.351280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1669611600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1669604400
value1=1.347690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1668186000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1668178800
value1=1.325630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1668106800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1668099600
value1=1.333180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1667556000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1667548800
value1=1.364020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1667296800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1667289600
value1=1.354520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1667224800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1667217600
value1=1.367740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1666789200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1666782000
value1=1.350800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1666292400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1666285200
value1=1.366740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1666083600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1666076400
value1=1.365940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1665680400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1665673200
value1=1.397790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1664996400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1664989200
value1=1.370070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1664402400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1664395200
value1=1.360040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1663758000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1663750800
value1=1.339720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1663286400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1663279200
value1=1.324060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1663171200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1663164000
value1=1.321060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1663153200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1663146000
value1=1.320240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1662537600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1662530400
value1=1.320810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1662440400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1662433200
value1=1.309320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1662145200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1662138000
value1=1.307670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1662037200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1662030000
value1=1.320080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1661432400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1661425200
value1=1.289110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1660924800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1660917600
value1=1.300440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1660820400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1660813200
value1=1.295200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1660626000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1660618800
value1=1.292700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1658145600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1658138400
value1=1.297010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1656946800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1656939600
value1=1.283350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1656694800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1656687600
value1=1.296770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1656421200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1656414000
value1=1.281700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1655492400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1655485200
value1=1.308290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1655244000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1655236800
value1=1.297800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1655222400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1655215200
value1=1.294960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1655168400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1655161200
value1=1.290430
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
value1=1.262640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1654534800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1654527600
value1=1.253340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1652472000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1652464800
value1=1.291060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1651780800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1651773600
value1=1.286810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1651510800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1651503600
value1=1.291570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1651233600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1651226400
value1=1.272490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1650898800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1650891600
value1=1.277650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1650542400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1650535200
value1=1.245610
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
value1=1.262290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1649340000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1649332800
value1=1.257380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1649181600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1649174400
value1=1.240030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1648494000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1648486800
value1=1.259250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1648144800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1648137600
value1=1.250560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1647558000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1647550800
value1=1.260860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1647424800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1647417600
value1=1.273090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1646737200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1646730000
value1=1.284500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1646366400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1646359200
value1=1.273020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1646078400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1646071200
value1=1.265590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1645729200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1645722000
value1=1.288530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1645711200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1645704000
value1=1.285560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1645635600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1645628400
value1=1.267760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1644274800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1644267600
value1=1.265380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1643716800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1643709600
value1=1.265250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1643209200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1643202000
value1=1.255560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1641996000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1641988800
value1=1.252950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1641823200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1641816000
value1=1.261600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1641236400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1641229200
value1=1.278120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1640944800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1640937600
value1=1.271770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1640293200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1640286000
value1=1.279830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1640026800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1640019600
value1=1.297160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1639598400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1639591200
value1=1.292760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1639512000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1639504800
value1=1.286790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1638968400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1638961200
value1=1.261820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635958800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635951600
value1=1.246560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635339600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635332400
value1=1.243640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634641200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634634000
value1=1.231660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634299200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634292000
value1=1.233240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633946400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633939200
value1=1.244250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632855600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632848400
value1=1.271550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632146400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632139200
value1=1.284130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631278800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631271600
value1=1.259060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630688400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630681200
value1=1.249490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630350000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630342800
value1=1.257810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629831600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629824400
value1=1.258040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629234000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629226800
value1=1.265680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629201600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629194400
value1=1.263020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629187200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629180000
value1=1.260530
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
value1=1.259190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628276400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628269200
value1=1.258640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628190000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628182800
value1=1.247210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626969600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626962400
value1=1.253690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625058000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625050800
value1=1.243160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624971600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624964400
value1=1.239020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624471200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624464000
value1=1.225240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624014000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624006800
value1=1.239340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623261600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623254400
value1=1.205320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622786400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622779200
value1=1.213190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621015200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621008000
value1=1.207650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620943200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620936000
value1=1.219870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620644400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620637200
value1=1.209390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620417600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620410400
value1=1.213330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620144000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620136800
value1=1.235180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618329600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618322400
value1=1.263640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617217200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617210000
value1=1.256160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616108400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616101200
value1=1.252640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613970000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613962800
value1=1.258650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613109600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613102400
value1=1.273620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612850400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612843200
value1=1.271680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611943200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611936000
value1=1.273390
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
date1=1611799200
value1=1.283830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611770400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611763200
value1=1.280600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611658800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611651600
value1=1.278860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610737200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610730000
value1=1.276950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610629200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610622000
value1=1.266380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609390800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609383600
value1=1.273160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608328800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608321600
value1=1.280270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607965200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607958000
value1=1.271630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606759200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606752000
value1=1.291910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606748400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606741200
value1=1.294530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605250800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605243600
value1=1.317820
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
value1=1.314720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605178800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605171600
value1=1.311040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604941200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604934000
value1=1.292410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604408400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604401200
value1=1.313680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603346400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603339200
value1=1.318570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602262800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602255600
value1=1.312820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600938000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600930800
value1=1.342030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600891200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600884000
value1=1.338230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600776000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600768800
value1=1.334050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600696800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600689600
value1=1.324770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600322400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600315200
value1=1.323600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599260400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599253200
value1=1.304150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598900400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598893200
value1=1.302280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598630400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598623200
value1=1.304290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597258800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597251600
value1=1.322810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596636000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596628800
value1=1.324450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596114000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596106800
value1=1.343290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594728000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594720800
value1=1.364450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594378800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594371600
value1=1.363910
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
date1=1594317600
value1=1.359020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594285200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594278000
value1=1.349790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594234800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594227600
value1=1.353030
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
date1=1594159200
value1=1.361730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1593608400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1593601200
value1=1.354780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1593198000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1593190800
value1=1.372330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591383600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591376400
value1=1.338850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591124400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591117200
value1=1.348030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1589886000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1589878800
value1=1.390430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1589212800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1589205600
value1=1.402020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1588968000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1588960800
value1=1.390580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1588568400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1588561200
value1=1.415840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1588284000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1588276800
value1=1.396680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1587477600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1587470400
value1=1.427280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1586282400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1586275200
value1=1.394430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1586260800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1586253600
value1=1.401540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1585677600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1585670400
value1=1.435690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1585670400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1585663200
value1=1.427530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1584705600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1584698400
value1=1.414490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582851600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582844400
value1=1.340040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582552800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582545600
value1=1.331310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1581537600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1581530400
value1=1.323130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1581530400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1581523200
value1=1.324880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580760000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580752800
value1=1.330590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580382000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580374800
value1=1.323120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580324400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580317200
value1=1.321570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580259600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580252400
value1=1.315030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1579712400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1579705200
value1=1.304030
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
date1=1579284000
value1=1.308220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1578574800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1578567600
value1=1.306450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1578510000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1578502800
value1=1.305150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1577462400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1577455200
value1=1.307520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1577455200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1577448000
value1=1.308180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1577386800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1577379600
value1=1.311310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1576695600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1576688400
value1=1.309820
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
value1=1.315700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1575478800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1575471600
value1=1.325870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1574859600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1574852400
value1=1.326020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1574283600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1574276400
value1=1.333440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1573236000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1573228800
value1=1.324300
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
date1=1572372000
value1=1.310340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1571320800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1571313600
value1=1.315760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1570737600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1570730400
value1=1.326460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1570111200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1570104000
value1=1.334310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1569949200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1569942000
value1=1.329580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1569938400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1569931200
value1=1.328590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1568743200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1568736000
value1=1.330010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1568307600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1568300400
value1=1.322580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1567443600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1567436400
value1=1.335620
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
value1=1.324560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1566410400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1566403200
value1=1.325740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1565197200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1565190000
value1=1.335240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1563901200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1563894000
value1=1.317230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1563876000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1563868800
value1=1.314890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1562349600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1562342400
value1=1.314370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1561748400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1561741200
value1=1.306210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1561676400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1561669200
value1=1.308680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1561669200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1561662000
value1=1.309410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1561053600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1561046400
value1=1.317090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1560772800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1560765600
value1=1.342380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1559854800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1559847600
value1=1.336070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1559743200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1559736000
value1=1.335780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1559664000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1559656800
value1=1.341640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1559160000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1559152800
value1=1.354140
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
value1=1.348300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1558634400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1558627200
value1=1.350970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1558544400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1558537200
value1=1.336030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1558458000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1558450800
value1=1.339080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1558112400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1558105200
value1=1.352050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1557511200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1557504000
value1=1.337700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1556200800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1556193600
value1=1.352130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1556132400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1556125200
value1=1.350370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1555520400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1555513200
value1=1.327920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1555002000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1554994800
value1=1.340310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1554800400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1554793200
value1=1.330270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1554487200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1554480000
value1=1.339950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1554480000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1554472800
value1=1.341000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1554159600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1554152400
value1=1.330370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1553270400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1553263200
value1=1.342170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1553198400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1553191200
value1=1.339760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1553119200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1553112000
value1=1.325740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1551794400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1551787200
value1=1.335640
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
value1=1.324280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1551106800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1551099600
value1=1.310950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1550692800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1550685600
value1=1.315170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1549058400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1549051200
value1=1.307060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1547208000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1547200800
value1=1.317850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1545915600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1545908400
value1=1.363860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1544468400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1544461200
value1=1.341230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1543960800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1543953600
value1=1.325800
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
value1=1.336690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1543352400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1543345200
value1=1.333130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1542924000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1542916800
value1=1.318140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1542322800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1542315600
value1=1.316180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1542070800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1542063600
value1=1.325540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1541793600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1541786400
value1=1.323850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1541718000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1541710800
value1=1.318960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1541077200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1541070000
value1=1.309210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1541023200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1541016000
value1=1.317710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1539802800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1539795600
value1=1.301290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1537398000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1537390800
value1=1.291150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1537369200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1537362000
value1=1.293020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1536148800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1536141600
value1=1.321250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1535698800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1535691600
value1=1.303020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1535652000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1535644800
value1=1.300640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1534982400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1534975200
value1=1.298370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1534359600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1534352400
value1=1.318170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1533938400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1533931200
value1=1.316050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1533906000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1533898800
value1=1.312300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1533733200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1533726000
value1=1.308760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1532977200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1532970000
value1=1.298960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1532541600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1532534400
value1=1.307500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1532019600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1532012400
value1=1.327540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1532012400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1532005200
value1=1.325320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1529424000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1529416800
value1=1.329090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1529089200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1529082000
value1=1.320910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1528462800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1528455600
value1=1.303300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1528308000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1528300800
value1=1.285800
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
value1=1.307480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1527778800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1527771600
value1=1.282120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1527771600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1527764400
value1=1.283500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1527696000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1527688800
value1=1.294780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1527606000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1527598800
value1=1.305470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1527058800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1527051600
value1=1.286600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1526666400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1526659200
value1=1.291880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1526407200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1526400000
value1=1.292880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1526054400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1526047200
value1=1.272510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1525942800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1525935600
value1=1.281840
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
date1=1524664800
value1=1.290400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1524178800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1524171600
value1=1.268120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1524085200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1524078000
value1=1.266640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1523473200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1523466000
value1=1.256230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1523343600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1523336400
value1=1.267340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1523304000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1523296800
value1=1.268340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1521824400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1521817200
value1=1.282040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1521720000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1521712800
value1=1.282550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1521608400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1521601200
value1=1.300630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1521212400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1521205200
value1=1.310330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1520625600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1520618400
value1=1.281090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1520352000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1520344800
value1=1.285810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1520028000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1520020800
value1=1.292360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1519941600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1519934400
value1=1.290140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1519232400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1519225200
value1=1.268860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1519210800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1519203600
value1=1.267860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1519131600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1519124400
value1=1.261200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1517853600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1517846400
value1=1.249950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1516579200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1516399200
value1=1.251630
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
value1=1.243870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1515672000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1515664800
value1=1.259830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1515114000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1515106800
value1=1.247900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1514577600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1514570400
value1=1.251060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1514318400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1514311200
value1=1.268050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1513108800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1513101600
value1=1.290030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1512687600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1512680400
value1=1.287050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1512669600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1512662400
value1=1.287610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1512486000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1512478800
value1=1.263330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1512399600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1512392400
value1=1.265220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1512050400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1512043200
value1=1.290820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1511964000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1511956800
value1=1.285620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1511877600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1511870400
value1=1.280730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1511816400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1511809200
value1=1.277440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1511438400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1511431200
value1=1.268220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1510941600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1510934400
value1=1.283140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1510660800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1510653600
value1=1.276530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1510603200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1510596000
value1=1.274420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1510239600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1510232400
value1=1.268370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1510081200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1510074000
value1=1.281050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1509469200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1509462000
value1=1.290610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1509127200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1509120000
value1=1.291780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1508943600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1508936400
value1=1.272460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1508882400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1508875200
value1=1.269990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1508796000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1508788800
value1=1.266350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1508266800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1508259600
value1=1.258420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1506384000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1506376800
value1=1.239290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1505336400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1505329200
value1=1.222460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1504638000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1504630800
value1=1.233170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1504209600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1504202400
value1=1.251080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1503694800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1503687600
value1=1.246370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1502910000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1502902800
value1=1.269160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1502366400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1502359200
value1=1.274220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1502125200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1502118000
value1=1.272220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1501873200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1501866000
value1=1.266090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1501761600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1501754400
value1=1.262420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1501268400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1501261200
value1=1.241480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1500577200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1500570000
value1=1.254060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1500487200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1500480000
value1=1.257400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1500393600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1500386400
value1=1.257640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1499194800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1499187600
value1=1.290790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1498665600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1498658400
value1=1.307280
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
value1=1.317050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1498212000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1498204800
value1=1.320600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1498068000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1498060800
value1=1.331810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1497834000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1497654000
value1=1.320390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1497459600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1497452400
value1=1.316280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1497448800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1497441600
value1=1.318590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1495652400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1495645200
value1=1.343070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1494972000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1494964800
value1=1.357040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1494010800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1494003600
value1=1.368510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1493755200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1493748000
value1=1.375090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1492801200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1492794000
value1=1.353300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1492527600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1492520400
value1=1.336620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1492455600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1492448400
value1=1.325770
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
value1=1.325660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1491912000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1491904800
value1=1.330990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1491847200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1491840000
value1=1.333810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1490904000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1490896800
value1=1.327310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1489683600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1489676400
value1=1.328490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1489165200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1489158000
value1=1.341930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1488992400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1488985200
value1=1.347700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1488376800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1488369600
value1=1.334450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1487782800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1487775600
value1=1.320490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1485885600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1485878400
value1=1.298050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1485363600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1485356400
value1=1.309360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1483610400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1483603200
value1=1.325120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1483124400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1483117200
value1=1.340450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1482242400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1482235200
value1=1.343410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1480518000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1480510800
value1=1.335300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1480114800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1480107600
value1=1.354180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1479754800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1479747600
value1=1.338940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1478678400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1478671200
value1=1.353240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1478278800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1478271600
value1=1.347300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1476990000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1476982800
value1=1.322370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1476486000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1476478800
value1=1.311920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1475852400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1475845200
value1=1.329700
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
value1=1.308350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1474934400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1474927200
value1=1.324540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1473876000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1473868800
value1=1.320980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1472230800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1472223600
value1=1.286260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1471903200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1471896000
value1=1.296800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1471629600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1471622400
value1=1.289090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1471348800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1471341600
value1=1.286170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1470344400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1470337200
value1=1.299940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1470160800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1470153600
value1=1.300410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1469188800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1469181600
value1=1.314610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1468947600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1468940400
value1=1.305980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1468530000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1468522800
value1=1.286700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1468342800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1468335600
value1=1.299940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1468004400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1467997200
value1=1.309780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1467914400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1467907200
value1=1.288510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1467763200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1467756000
value1=1.302450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1467396000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1467388800
value1=1.286510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1467248400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1467241200
value1=1.292570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1466694000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1466686800
value1=1.269150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1466445600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1466438400
value1=1.276810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1466186400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1466179200
value1=1.282520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1465347600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1465340400
value1=1.272830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1464285600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1464278400
value1=1.292890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1463468400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1463461200
value1=1.283980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1462996800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1462989600
value1=1.282930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1461063600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1461056400
value1=1.274090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1460469600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1460462400
value1=1.284680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1460397600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1460390400
value1=1.289640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1460026800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1460019600
value1=1.302420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1459530000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1459522800
value1=1.314210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1459339200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1459332000
value1=1.300630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1457643600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1457636400
value1=1.339990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1457463600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1457456400
value1=1.341700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1457384400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1457377200
value1=1.325770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1457377200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1457370000
value1=1.327950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1456862400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1456855200
value1=1.340010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1456491600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1456484400
value1=1.350070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1456358400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1456351200
value1=1.368040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1455908400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1455901200
value1=1.384610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1454947200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1454940000
value1=1.398580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1453291200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1453284000
value1=1.469740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1453273200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1453266000
value1=1.464760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1452060000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1452052800
value1=1.404350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1451498400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1451491200
value1=1.393480
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
value1=1.394760
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
value1=1.392320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1450454400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1450447200
value1=1.400900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1450292400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1450285200
value1=1.385520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1449838800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1449831600
value1=1.368680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1447909200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1447902000
value1=1.325660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1447880400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1447873200
value1=1.337080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1446573600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1446566400
value1=1.316710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1446235200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1446228000
value1=1.305520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1446066000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1446058800
value1=1.309070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1444867200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1444860000
value1=1.291690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1444402800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1444395600
value1=1.290100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1444240800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1444233600
value1=1.296760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1443805200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1443798000
value1=1.319840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1443661200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1443654000
value1=1.330400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1443560400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1443553200
value1=1.346060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1443524400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1443517200
value1=1.343880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1443114000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1443106800
value1=1.342180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1442530800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1442523600
value1=1.307820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1442437200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1442430000
value1=1.315750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1441742400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1441735200
value1=1.318760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1441731600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1441724400
value1=1.319760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1441306800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1441299600
value1=1.315170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1439492400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1439485200
value1=1.309420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1438351200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1438344000
value1=1.306490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1437588000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1437580800
value1=1.306030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1435176000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1435168800
value1=1.242480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1435082400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1435075200
value1=1.237750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1435010400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1435003200
value1=1.233030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1434733200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1434726000
value1=1.230350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1433930400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1433923200
value1=1.229650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1433880000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1433872800
value1=1.230930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1432836000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1432828800
value1=1.254560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1432746000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1432738800
value1=1.248660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1432062000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1432054800
value1=1.225480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1431525600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1431518400
value1=1.196650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1431442800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1431435600
value1=1.202070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1430938800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1430931600
value1=1.196130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1430852400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1430845200
value1=1.200060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1429279200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1429272000
value1=1.213210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1429207200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1429200000
value1=1.221730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1428505200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1428498000
value1=1.240370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1427817600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1427810400
value1=1.279150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1427716800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1427709600
value1=1.264930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1427212800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1427205600
value1=1.244270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1425992400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1425985200
value1=1.269090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1425405600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1425398400
value1=1.242880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1424955600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1424948400
value1=1.238370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1424883600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1424876400
value1=1.240520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1424876400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1424869200
value1=1.239690
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
value1=1.263210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1424700000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1424692800
value1=1.261930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1424455200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1424448000
value1=1.257240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1423764000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1423756800
value1=1.246430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1423504800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1423497600
value1=1.242420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1423040400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1423033200
value1=1.238850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1421337600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1421330400
value1=1.179930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1421229600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1421222400
value1=1.202460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1420635600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1420628400
value1=1.187530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1418396400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1418389200
value1=1.159910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1418317200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1418310000
value1=1.154350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1418072400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1418065200
value1=1.148730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1417802400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1417795200
value1=1.146970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1417176000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1417168800
value1=1.139850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1416409200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1416402000
value1=1.136420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1415818800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1415811600
value1=1.127680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1415120400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1415113200
value1=1.143310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1415113200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1415106000
value1=1.143440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1414774800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1414767600
value1=1.132660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1414598400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1414591200
value1=1.112500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1412938800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1412931600
value1=1.123020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1411578000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1411570800
value1=1.112320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1411502400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1411495200
value1=1.109160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1410282000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1410274800
value1=1.103970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1410195600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1410188400
value1=1.093540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1409727600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1409720400
value1=1.095030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1408525200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1408518000
value1=1.096460
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
value1=1.091490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1407333600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1407326400
value1=1.098950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1406898000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1406890800
value1=1.095000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1406289600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1406282400
value1=1.077600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1404309600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1404302400
value1=1.062240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1404302400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1404295200
value1=1.062580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1403856000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1403848800
value1=1.067330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1403715600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1403708400
value1=1.071610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1403596800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1403589600
value1=1.071440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1403136000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1403128800
value1=1.083070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1402574400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1402567200
value1=1.085020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1402560000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1402552800
value1=1.085480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1401951600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1401944400
value1=1.096200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1401904800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1401897600
value1=1.096270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1401130800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1401123600
value1=1.084870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1400605200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1400598000
value1=1.092420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1399978800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1399971600
value1=1.093130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1399640400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1399633200
value1=1.081340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1399626000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1399618800
value1=1.081360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1399460400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1399453200
value1=1.087160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1397232000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1397224800
value1=1.097970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1397080800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1397073600
value1=1.085420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1397073600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1397066400
value1=1.087820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1395936000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1395928800
value1=1.105160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1395871200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1395864000
value1=1.107720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1395774000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1395766800
value1=1.115200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1394712000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1394704800
value1=1.105650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1393268400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1393261200
value1=1.105030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1392926400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1392919200
value1=1.112030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1391428800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1391421600
value1=1.105110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1391184000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1391176800
value1=1.122560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1389733200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1389726000
value1=1.096660
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
value1=1.095630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1388430000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1388422800
value1=1.063220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1387810800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1387803600
value1=1.058640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1387389600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1387382400
value1=1.067010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1386856800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1386849600
value1=1.055730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1386849600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1386842400
value1=1.056480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1385571600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1385564400
value1=1.061040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1384776000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1384768800
value1=1.041490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1382619600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1382612400
value1=1.041490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1381960800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1381953600
value1=1.032340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1381528800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1381521600
value1=1.033870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1381384800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1381377600
value1=1.042720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1379898000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1379714400
value1=1.031400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1378825200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1378818000
value1=1.032740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1377176400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1377169200
value1=1.050540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1376474400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1376467200
value1=1.037730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1375876800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1375869600
value1=1.043580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1374678000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1374670800
value1=1.025850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1374602400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1374595200
value1=1.028700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1372780800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1372773600
value1=1.057420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1372446000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1372438800
value1=1.056080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1372316400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1372309200
value1=1.042250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1372068000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1372060800
value1=1.053230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1371733200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1371726000
value1=1.038720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1371679200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1371672000
value1=1.029440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1371506400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1371499200
value1=1.021080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1370293200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1370286000
value1=1.025730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1368792000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1368784800
value1=1.026470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1368784800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1368777600
value1=1.025360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1368630000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1368622800
value1=1.022720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1368187200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1368180000
value1=1.010760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1368136800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1368129600
value1=1.009460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1367935200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1367928000
value1=1.003390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1367416800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1367409600
value1=1.004670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1367344800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1367337600
value1=1.005230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1366873200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1366866000
value1=1.022410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1366221600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1366214400
value1=1.030080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1365181200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1365174000
value1=1.023860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1365109200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1365102000
value1=1.010170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1363874400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1363867200
value1=1.019540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1363359600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1363352400
value1=1.018760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1362150000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1362142800
value1=1.034940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1361552400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1361545200
value1=1.026390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1361379600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1361372400
value1=1.017820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1361289600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1361282400
value1=1.014550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1361282400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1361275200
value1=1.013690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1360947600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1360940400
value1=1.008990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1360339200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1360332000
value1=1.003910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1359666000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1359658800
value1=0.995250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1359655200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1359648000
value1=0.998260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1359504000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1359496800
value1=1.000280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1359050400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1359043200
value1=1.004010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1359036000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1359028800
value1=1.002400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1357855200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1357848000
value1=0.983200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1356094800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1356087600
value1=0.992000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1355400000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1355392800
value1=0.982470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1354896000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1354888800
value1=0.987140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1353348000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1353340800
value1=0.995050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1352473200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1352466000
value1=1.004070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1352314800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1352307600
value1=0.998640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1351789200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1351782000
value1=0.995990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1351688400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1351681200
value1=0.995540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1351576800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1351569600
value1=1.002390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1351278000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1351270800
value1=1.000070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1350921600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1350914400
value1=0.997210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1350903600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1350896400
value1=0.995110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1350648000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1350640800
value1=0.988190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1350403200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1350396000
value1=0.987190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1349373600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1349366400
value1=0.980970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1348682400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1348675200
value1=0.986320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1348495200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1348488000
value1=0.982230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1348135200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1348128000
value1=0.981860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1347436800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1347429600
value1=0.971300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1347040800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1347033600
value1=0.976480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1347019200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1347012000
value1=0.980950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1346868000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1346860800
value1=0.992630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1345651200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1345644000
value1=0.995120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1345154400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1345147200
value1=0.985500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1344002400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1343995200
value1=1.000990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1343426400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1343419200
value1=1.003140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1343379600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1343372400
value1=1.006890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1343253600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1343246400
value1=1.013450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1342803600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1342796400
value1=1.013240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1342202400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1342195200
value1=1.013350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1341601200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1341594000
value1=1.020980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1341342000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1341334800
value1=1.011700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1340985600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1340978400
value1=1.016070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1339992000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1339984800
value1=1.018850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1339156800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1339149600
value1=1.035240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1339088400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1339081200
value1=1.020880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1338980400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1338973200
value1=1.030580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1338566400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1338559200
value1=1.043340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1338487200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1338480000
value1=1.037270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1337796000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1337788800
value1=1.029500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1336755600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1336748400
value1=0.994910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1336500000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1336492800
value1=1.002960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1335844800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1335837600
value1=0.989150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1335546000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1335538800
value1=0.979990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1335438000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1335430800
value1=0.980450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1335373200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1335366000
value1=0.982660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1333728000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1333720800
value1=0.998370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1333630800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1333623600
value1=1.000560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1332511200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1332504000
value1=1.003980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1332259200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1332252000
value1=0.995910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1330956000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1330948800
value1=0.996540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1330614000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1330606800
value1=0.984900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1330333200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1330326000
value1=1.002610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1329926400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1329919200
value1=1.002090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1329368400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1329361200
value1=1.003520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1325768400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1325761200
value1=1.020570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1325599200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1325592000
value1=1.008320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1324634400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1324627200
value1=1.017930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1323817200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1323810000
value1=1.035320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1322834400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1322827200
value1=1.008580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1322074800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1322067600
value1=1.048850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1320919200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1320912000
value1=1.027270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1320847200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1320840000
value1=1.022240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1319565600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1319558400
value1=1.018400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1319216400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1319209200
value1=1.006250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1318611600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1318604400
value1=1.011410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1318003200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1317996000
value1=1.026710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1317902400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1317895200
value1=1.036620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1317380400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1317373200
value1=1.045490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1316649600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1316642400
value1=1.009220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1315825200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1315818000
value1=1.002310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1315238400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1315231200
value1=0.994020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1314979200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1314972000
value1=0.984550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1314633600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1314626400
value1=0.973490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1313452800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1313445600
value1=0.978400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1312869600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1312862400
value1=0.999720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1311174000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1311166800
value1=0.945490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1310468400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1310461200
value1=0.978510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1310396400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1310389200
value1=0.970320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1310054400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1310047200
value1=0.957190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1309514400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1309507200
value1=0.961000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1309341600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1309334400
value1=0.977800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1308952800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1308945600
value1=0.989310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1308945600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1308938400
value1=0.988580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1308848400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1308841200
value1=0.982930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1308135600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1308128400
value1=0.966540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1307646000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1307638800
value1=0.972780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1307116800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1307109600
value1=0.985540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1307005200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1306998000
value1=0.980320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1306861200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1306854000
value1=0.966000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1306314000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1306306800
value1=0.982380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1306152000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1306144800
value1=0.980500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1305554400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1305547200
value1=0.977770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1305208800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1305201600
value1=0.969080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1305122400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1305115200
value1=0.950880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1305072000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1305064800
value1=0.955750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1303149600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1303142400
value1=0.972860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1302260400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1302253200
value1=0.953080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1301911200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1301904000
value1=0.961130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1301684400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1301677200
value1=0.962120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1301673600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1301666400
value1=0.963430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1301079600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1301072400
value1=0.983360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1300305600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1300298400
value1=0.997350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1299682800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1299675600
value1=0.966510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1298646000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1298638800
value1=0.979040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1297954800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1297947600
value1=0.981300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1297447200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1297440000
value1=0.987860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1297339200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1297332000
value1=0.999070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1296835200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1296828000
value1=0.982710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1296590400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1296583200
value1=0.989680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1295629200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1295622000
value1=0.990530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1294416000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1294408800
value1=0.989490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1294164000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1294156800
value1=1.000340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1293199200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1293192000
value1=1.004820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1293022800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1293015600
value1=1.010620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1292868000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1292860800
value1=1.021000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1292601600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1292594400
value1=1.012270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1292256000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1292248800
value1=1.002400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1291384800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1291377600
value1=1.000260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1291370400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1291363200
value1=1.001590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1291302000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1291294800
value1=1.008070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1291280400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1291273200
value1=1.012230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1291132800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1291125600
value1=1.029340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1289988000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1289980800
value1=1.026560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1289559600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1289552400
value1=1.015260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1288785600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1288778400
value1=1.006110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1288710000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1288702800
value1=1.008090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1288695600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1288688400
value1=1.008910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1288000800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1287993600
value1=1.017430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1286974800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1286967600
value1=1.005650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1286391600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1286384400
value1=1.006470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1285862400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1285855200
value1=1.022860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1285257600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1285250400
value1=1.038580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1284490800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1284483600
value1=1.021140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1284400800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1284393600
value1=1.026460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1283947200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1283940000
value1=1.050810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1283533200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1283526000
value1=1.040860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1283277600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1283270400
value1=1.067240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1282244400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1282237200
value1=1.042120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1282136400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1282129200
value1=1.028140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1281693600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1281686400
value1=1.035270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1281427200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1281420000
value1=1.032380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1281110400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1281103200
value1=1.025460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1280959200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1280952000
value1=1.015890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1280242800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1280235600
value1=1.025100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1279710000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1279702800
value1=1.034690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1278907200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1278900000
value1=1.029820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1277920800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1277913600
value1=1.063350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1277298000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1277290800
value1=1.034780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1276538400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1276531200
value1=1.021950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1276189200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1276182000
value1=1.028250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1276106400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1276099200
value1=1.035990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1275508800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1275501600
value1=1.036670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1274277600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1274270400
value1=1.052400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1273842000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1273834800
value1=1.027670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1273744800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1273737600
value1=1.010610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1273183200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1273176000
value1=1.065050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1273140000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1273132800
value1=1.041390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1273078800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1273071600
value1=1.033140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1272996000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1272988800
value1=1.025560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1271685600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1271678400
value1=1.022120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1271671200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1271664000
value1=1.018470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1271257200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1271250000
value1=0.995900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1270468800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1270461600
value1=1.004620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1270148400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1270141200
value1=1.006740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1269453600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1269446400
value1=1.027770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1268856000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1268848800
value1=1.006680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1268841600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1268834400
value1=1.009450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1268830800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1268823600
value1=1.010390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1268762400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1268755200
value1=1.013580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1265374800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1265367600
value1=1.078220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1265119200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1265112000
value1=1.056520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1264525200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1264518000
value1=1.068890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1264514400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1264507200
value1=1.066450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1264118400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1264111200
value1=1.053270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1264078800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1264071600
value1=1.052990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1263178800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1263171600
value1=1.026200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1262804400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1262797200
value1=1.032140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1262192400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1262185200
value1=1.055550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1261580400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1261573200
value1=1.048670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1261054800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1261047600
value1=1.074490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1260309600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1260302400
value1=1.067720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1258981200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1258974000
value1=1.055960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1258632000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1258624800
value1=1.062320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1257994800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1257987600
value1=1.042140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1256637600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1256630400
value1=1.072300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1256130000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1256122800
value1=1.056400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1255708800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1255701600
value1=1.042500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1255618800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1255611600
value1=1.036500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1255359600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1255352400
value1=1.031200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1255100400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1255093200
value1=1.042300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1254916800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1254909600
value1=1.053900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1254841200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1254834000
value1=1.060900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1254488400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1254481200
value1=1.091600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1253624400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1253617200
value1=1.065500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1253556000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1253548800
value1=1.084400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1253106000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1253098800
value1=1.066700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1253048400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1253041200
value1=1.070900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1252076400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1252069200
value1=1.088100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1251738000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1251730800
value1=1.106580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1251295200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1251288000
value1=1.093720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1250175600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1250168400
value1=1.078850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1249999200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1249992000
value1=1.097020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1249938000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1249930800
value1=1.093310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1248195600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1248188400
value1=1.097620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1247652000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1247644800
value1=1.131070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1247583600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1247576400
value1=1.142250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1246557600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1246550400
value1=1.162780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1245099600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1245092400
value1=1.137030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1244466000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1244458800
value1=1.129720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1244221200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1244214000
value1=1.116390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1243407600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1243400400
value1=1.112570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1242770400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1242763200
value1=1.151810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1242676800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1242669600
value1=1.160630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1242255600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1242248400
value1=1.176980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1240333200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1240326000
value1=1.248980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1240308000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1240300800
value1=1.242330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1239825600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1239818400
value1=1.200880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1239735600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1239728400
value1=1.205680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1238410800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1238403600
value1=1.253400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1238403600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1238396400
value1=1.250400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1238162400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1238155200
value1=1.241650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1236006000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1235998800
value1=1.289300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1235383200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1235376000
value1=1.237300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1235048400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1235041200
value1=1.247500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1234526400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1234519200
value1=1.228700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1234303200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1234296000
value1=1.249300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1233327600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1233320400
value1=1.242300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1231956000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1231948800
value1=1.244600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1231261200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1231254000
value1=1.175700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1229684400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1229677200
value1=1.240200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1229457600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1229450400
value1=1.219700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1228842000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1228834800
value1=1.272400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1227139200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1227132000
value1=1.255500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1224849600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1224842400
value1=1.284700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1224774000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1224766800
value1=1.274800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1224529200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1224522000
value1=1.198800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1224147600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1224140400
value1=1.196200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1223676000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1223668800
value1=1.202500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1223492400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1223485200
value1=1.125900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1223316000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1223308800
value1=1.109700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1223287200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1223280000
value1=1.092900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1222963200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1222956000
value1=1.077000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1222686000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1222678800
value1=1.043900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1222106400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1222099200
value1=1.033500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1221850800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1221843600
value1=1.042500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1221246000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1221238800
value1=1.059400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1221220800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1221213600
value1=1.066200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1220353200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1220346000
value1=1.075500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1219755600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1219748400
value1=1.056700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1218042000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1218034800
value1=1.048400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1217858400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1217851200
value1=1.031600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1217354400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1217347200
value1=1.028000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1217340000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1217332800
value1=1.026100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1215788400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1215781200
value1=1.017100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1214578800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1214571600
value1=1.004700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1214352000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1214344800
value1=1.010600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1213700400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1213693200
value1=1.017800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1213196400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1213189200
value1=1.015700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1212620400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1212613200
value1=1.019100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1212577200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1212570000
value1=1.013500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1212512400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1212505200
value1=1.008400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1212076800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1212069600
value1=0.982900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1211382000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1211374800
value1=0.983400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1211277600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1211270400
value1=0.986900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1211216400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1211209200
value1=0.989400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1210705200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1210698000
value1=0.999200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1210053600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1210046400
value1=1.009000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1210014000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1210006800
value1=1.011600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1209664800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1209657600
value1=1.022500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1208430000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1208422800
value1=0.998900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1208145600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1208138400
value1=1.027300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1207764000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1207756800
value1=1.022300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1206979200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1206972000
value1=1.028300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1206540000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1206532800
value1=1.010000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1206378000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1206370800
value1=1.017700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1205506800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1205499600
value1=0.996200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1205424000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1205416800
value1=0.979900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1205172000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1205164800
value1=0.998600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1204902000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1204894800
value1=0.975400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1204023600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1204016400
value1=0.994200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1203447600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1203440400
value1=1.016600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1202400000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1202392800
value1=1.013400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1202234400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1202227200
value1=1.007600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1202209200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1202202000
value1=1.002000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1201802400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1201795200
value1=1.009200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1201730400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1201723200
value1=0.986700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1201708800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1201701600
value1=0.991900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1201611600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1201604400
value1=0.997300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1201201200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1201194000
value1=1.006100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1200488400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1200481200
value1=1.028400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1199469600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1199462400
value1=1.003100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1199296800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1199289600
value1=0.997300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1199271600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1199264400
value1=0.990300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1198508400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1198501200
value1=0.986200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1198501200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1198494000
value1=0.987600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1196787600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1196780400
value1=1.014500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1194850800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1194843600
value1=0.951600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1194559200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1194552000
value1=0.939600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1194264000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1194256800
value1=0.930000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1193630400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1193623200
value1=0.958900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1193328000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1193320800
value1=0.961700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1191834000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1191826800
value1=0.980500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1191333600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1191326400
value1=1.000100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1190995200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1190988000
value1=0.994200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1190905200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1190898000
value1=0.997500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1190800800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1190793600
value1=1.010200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1190361600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1190354400
value1=0.994000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1189512000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1189504800
value1=1.044800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1188291600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1188284400
value1=1.059500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1187874000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1187866800
value1=1.050800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1187247600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1187240400
value1=1.084200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1186675200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1186668000
value1=1.065000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1186592400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1186585200
value1=1.045700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1185807600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1185800400
value1=1.070500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1185530400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1185523200
value1=1.061400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1185462000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1185454800
value1=1.050600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1184961600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1184954400
value1=1.049800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1184770800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1184763600
value1=1.048200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1184238000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1184230800
value1=1.049200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1184158800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1184151600
value1=1.061800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1183982400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1183975200
value1=1.044600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1183971600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1183964400
value1=1.045600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1183399200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1183392000
value1=1.052200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1182535200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1182528000
value1=1.066700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1182182400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1182175200
value1=1.075000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1181923200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1181916000
value1=1.060400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1181916000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1181908800
value1=1.062700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1181692800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1181685600
value1=1.068800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1181671200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1181664000
value1=1.065800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1181314800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1181307600
value1=1.069600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1180627200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1180620000
value1=1.066000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1180620000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1180612800
value1=1.068600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1179345600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1179338400
value1=1.106600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1179295200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1179288000
value1=1.096600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1179234000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1179226800
value1=1.101600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1178712000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1178704800
value1=1.110000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1178557200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1178550000
value1=1.100100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1176732000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1176724800
value1=1.131000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1176213600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1176206400
value1=1.146400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1174885200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1174878000
value1=1.164200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1173708000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1173700800
value1=1.169200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1173456000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1173448800
value1=1.172700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1173099600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1173092400
value1=1.181200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1173067200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1173060000
value1=1.179400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1172768400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1172761200
value1=1.175200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1172685600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1172678400
value1=1.173100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1172671200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1172664000
value1=1.169500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1172599200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1172592000
value1=1.167400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1171285200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1171278000
value1=1.171200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1171278000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1171270800
value1=1.171000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1170435600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1170428400
value1=1.185700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1169719200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1169712000
value1=1.174800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1167166800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1167159600
value1=1.162800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1166817600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1166810400
value1=1.159400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1166720400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1166713200
value1=1.157000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1166634000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1166626800
value1=1.142500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1166562000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1166554800
value1=1.150400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=20
name=SSSR#R0 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1672779600
date2=1674784800
value1=1.369910
value2=1.363680
</object>

<object>
type=20
name=SSSR#R1 Strength=Weak
hidden=1
color=8519755
background=1
selectable=0
filling=1
date1=1674097200
date2=1674784800
value1=1.352450
value2=1.351070
</object>

<object>
type=20
name=SSSR#R2 Strength=Untested
hidden=1
color=14053594
background=1
selectable=0
filling=1
date1=1674126000
date2=1674784800
value1=1.352640
value2=1.351360
</object>

<object>
type=20
name=SSSR#R3 Strength=Untested
hidden=1
color=14053594
background=1
selectable=0
filling=1
date1=1674230400
date2=1674784800
value1=1.350560
value2=1.348190
</object>

<object>
type=20
name=SSSR#R4 Strength=Untested
hidden=1
color=14053594
background=1
selectable=0
filling=1
date1=1674669600
date2=1674784800
value1=1.343770
value2=1.341380
</object>

<object>
type=20
name=SSSR#R5 Strength=Weak
hidden=1
color=8519755
background=1
selectable=0
filling=1
date1=1674730800
date2=1674784800
value1=1.341380
value2=1.340220
</object>

<object>
type=20
name=SSSR#S6 Strength=Weak
hidden=1
color=5197615
background=1
selectable=0
filling=1
date1=1674748800
date2=1674784800
value1=1.332292
value2=1.329349
</object>

<object>
type=100
name=SSSR#0LBL
hidden=1
color=3937500
width=6
selectable=0
code_arrow=140
date1=1674788400
value1=1.366795
</object>

<object>
type=101
name=SSSR#1LBL
hidden=1
descr=Debil Resistencia                   
color=8519755
selectable=0
angle=0
date1=1674788400
value1=1.351760
fontsz=10
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#2LBL
hidden=1
descr=No Probado Resistencia              
color=14053594
selectable=0
angle=0
date1=1674788400
value1=1.352000
fontsz=10
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#3LBL
hidden=1
descr=No Probado Resistencia              
color=14053594
selectable=0
angle=0
date1=1674788400
value1=1.349375
fontsz=10
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#4LBL
hidden=1
descr=No Probado Resistencia              
color=14053594
selectable=0
angle=0
date1=1674788400
value1=1.342575
fontsz=10
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#5LBL
hidden=1
descr=Debil Resistencia                   
color=8519755
selectable=0
angle=0
date1=1674788400
value1=1.340800
fontsz=10
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#6LBL
hidden=1
descr=Debil Soporte                       
color=5197615
selectable=0
angle=0
date1=1674788400
value1=1.330820
fontsz=10
fontnm=Courier New
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