<chart>
id=133367936195919952
symbol=NZDCHF
description=New Zealand Dollar vs Swiss Franc
period_type=1
period_size=1
digits=5
tick_size=0.000000
position_time=1691056800
scale_fix=0
scale_fixed_min=0.518700
scale_fixed_max=0.525700
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
shift_size=16.595745
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
tradehistory=1
window_left=1560
window_top=0
window_right=2340
window_bottom=898
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
windows_total=3

<expert>
name=CONTROL LOTAJE 2
path=Experts\CONTROL LOTAJE PERDIDAS GANANCIAS\CONTROL LOTAJE 2.ex5
expertmode=1
<inputs>
Capital_Base=24000.0
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
height=245.354111
objects=79

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
show_data=0
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
width=1
arrow=251
color=16777215
</graph>
period=20
method=1
</indicator>

<indicator>
name=Moving Average
path=
apply=1
show_data=0
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
color=16711935
</graph>
period=50
method=1
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\SUPRESFINAL PRUEBA 2.ex5
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
Ver_Linea_Historial=true
Color_Linea=65535
BackLimit=500
pus1=/////////////////////////////////////////////////
zone_show_weak=false
zone_show_untested=false
zone_show_turncoat=false
zone_fuzzfactor=0.75
SeparacionTexto=10
pus2=/////////////////////////////////////////////////
fractals_show=false
fractal_fast_factor=3.0
fractal_slow_factor=6.0
SetGlobals=true
</inputs>
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\Linea Maximos y Minimos.ex5
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
name=Linea_Maximo
draw=1
style=0
width=2
arrow=251
color=11186720
</graph>

<graph>
name=Linea_Minimo
draw=1
style=0
width=2
arrow=251
color=11186720
</graph>
<inputs>
Periodos=20
</inputs>
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\Zero-lag-MA.ex5
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
name=Zero lag MA
draw=10
style=0
width=2
arrow=251
color=11119017,9639167,3329330
</graph>
<inputs>
inpPrice=5
inpPeriod=70.0
</inputs>
</indicator>
<object>
type=109
name=2023.08.21 18:30 Subasta de Letras del Tesoro a 3 Meses
hidden=1
descr=Subasta de Letras del Tesoro a 3 Meses
color=16119285
selectable=0
date1=1692642600
</object>

<object>
type=109
name=2023.08.21 18:30 Subasta de Letras del Tesoro a 6 Meses
hidden=1
descr=Subasta de Letras del Tesoro a 6 Meses
color=16119285
selectable=0
date1=1692642600
</object>

<object>
type=109
name=2023.08.22 17:00 Ventas de Viviendas Existentes
hidden=1
descr=Ventas de Viviendas Existentes 4.07 M / 4.41 M
color=13353215
selectable=0
date1=1692723600
</object>

<object>
type=109
name=2023.08.22 17:00 Ventas de Viviendas de Segunda Mano m/m
hidden=1
descr=Ventas de Viviendas de Segunda Mano m/m -2.2% / -0.1%
color=13353215
selectable=0
date1=1692723600
</object>

<object>
type=109
name=2023.08.22 17:00 Índice de Actividad Manufacturera de la Fed de
hidden=1
descr=Índice de Actividad Manufacturera de la Fed de Richmond -7 / -7
color=16119285
selectable=0
date1=1692723600
</object>

<object>
type=109
name=2023.08.22 17:00 Envíos de Bienes Manufactureros de la Fed de R
hidden=1
descr=Envíos de Bienes Manufactureros de la Fed de Richmond
color=16119285
selectable=0
date1=1692723600
</object>

<object>
type=109
name=2023.08.22 17:00 Ingresos por Servicios de la Fed de Richmond
hidden=1
descr=Ingresos por Servicios de la Fed de Richmond 4 / -4
color=15658671
selectable=0
date1=1692723600
</object>

<object>
type=109
name=2023.08.23 17:00 Ventas de Viviendas Nuevas
hidden=1
descr=Ventas de Viviendas Nuevas 0.714 M / 0.728 M
color=13353215
selectable=0
date1=1692810000
</object>

<object>
type=109
name=2023.08.23 17:00 Ventas de Viviendas Nuevas m/m
hidden=1
descr=Ventas de Viviendas Nuevas m/m 4.4% / 0.2%
color=15658671
selectable=0
date1=1692810000
</object>

<object>
type=109
name=2023.08.23 17:30 AIE Cambio en las Reservas de Crudo
hidden=1
descr=AIE Cambio en las Reservas de Crudo -6.134 M / -2.299 M
color=15658671
selectable=0
date1=1692811800
</object>

<object>
type=109
name=2023.08.23 17:30 AIE Cambio en las Reservas de Crudo en Cushing
hidden=1
descr=AIE Cambio en las Reservas de Crudo en Cushing -3.133 M / -0.90
color=15658671
selectable=0
date1=1692811800
</object>

<object>
type=109
name=2023.08.23 17:30 AIE Cambio en la Importación de Petróleo
hidden=1
descr=AIE Cambio en la Importación de Petróleo 0.116 M / -2.270 M
color=13353215
selectable=0
date1=1692811800
</object>

<object>
type=109
name=2023.08.23 17:30 AIE Cambio en la Producción de Combustible Des
hidden=1
descr=AIE Cambio en la Producción de Combustible Destilado 0.337 M / 
color=13353215
selectable=0
date1=1692811800
</object>

<object>
type=109
name=2023.08.23 17:30 AIE Cambio en las Reservas de Combustible Dest
hidden=1
descr=AIE Cambio en las Reservas de Combustible Destilado 0.945 M / 0
color=13353215
selectable=0
date1=1692811800
</object>

<object>
type=109
name=2023.08.23 17:30 AIE Cambio en la Producción de Gasolina
hidden=1
descr=AIE Cambio en la Producción de Gasolina 0.130 M / 0.015 M
color=13353215
selectable=0
date1=1692811800
</object>

<object>
type=109
name=2023.08.23 17:30 AIE Cambio en las Reservas de Combustible para
hidden=1
descr=AIE Cambio en las Reservas de Combustible para Calefacción 0.50
color=13353215
selectable=0
date1=1692811800
</object>

<object>
type=109
name=2023.08.23 17:30 AIE Cambios en las Reservas de Gasolina
hidden=1
descr=AIE Cambios en las Reservas de Gasolina 1.468 M / 0.436 M
color=13353215
selectable=0
date1=1692811800
</object>

<object>
type=109
name=2023.08.23 17:30 Cambio de Entradas Diarias de Petróleo Crudo d
hidden=1
descr=Cambio de Entradas Diarias de Petróleo Crudo de Refinería de la
color=16119285
selectable=0
date1=1692811800
</object>

<object>
type=109
name=2023.08.23 17:30 Cambio en la Tasa de Utilización de las Refine
hidden=1
descr=Cambio en la Tasa de Utilización de las Refinerías de la EIA
color=16119285
selectable=0
date1=1692811800
</object>

<object>
type=109
name=2023.08.23 20:00 Subasta de Bonos del Estado a 20 años
hidden=1
descr=Subasta de Bonos del Estado a 20 años
color=16119285
selectable=0
date1=1692820800
</object>

<object>
type=109
name=2023.08.24 15:30 Pedidos de Bienes Duraderos m/m
hidden=1
descr=Pedidos de Bienes Duraderos m/m -5.2% / 0.3%
color=13353215
selectable=0
date1=1692891000
</object>

<object>
type=109
name=2023.08.24 15:30 Pedidos Básicos de Bienes Buraderos m/m
hidden=1
descr=Pedidos Básicos de Bienes Buraderos m/m 0.5% / 0.0%
color=15658671
selectable=0
date1=1692891000
</object>

<object>
type=109
name=2023.08.24 15:30 Pedidos de Bienes Duraderos excl. Defensa m/m
hidden=1
descr=Pedidos de Bienes Duraderos excl. Defensa m/m -5.4% / 0.0%
color=13353215
selectable=0
date1=1692891000
</object>

<object>
type=109
name=2023.08.24 15:30 Pedidos de Bienes de Capital no Relacionados c
hidden=1
descr=Pedidos de Bienes de Capital no Relacionados con la Defensa exc
color=15658671
selectable=0
date1=1692891000
</object>

<object>
type=109
name=2023.08.24 15:30 Envíos de Bienes de Capital no Relacionados co
hidden=1
descr=Envíos de Bienes de Capital no Relacionados con la Defensa excl
color=13353215
selectable=0
date1=1692891000
</object>

<object>
type=109
name=2023.08.24 15:30 Índice Manufacturero de la Fed de Chicago
hidden=1
descr=Índice Manufacturero de la Fed de Chicago -0.32 / 0.02
color=13353215
selectable=0
date1=1692891000
</object>

<object>
type=109
name=2023.08.24 15:30 Peticiones Iniciales del Subsidio de Desempleo
hidden=1
descr=Peticiones Iniciales del Subsidio de Desempleo 230 K / 244 K
color=15658671
selectable=0
date1=1692891000
</object>

<object>
type=109
name=2023.08.24 15:30 Peticiones Continuas del Subsidio de Desempleo
hidden=1
descr=Peticiones Continuas del Subsidio de Desempleo 1.702 M / 1.700 
color=13353215
selectable=0
date1=1692891000
</object>

<object>
type=109
name=2023.08.24 15:30 Número Medio de Peticiones Iniciales del Subsi
hidden=1
descr=Número Medio de Peticiones Iniciales del Subsidio de Desempleo 
color=13353215
selectable=0
date1=1692891000
</object>

<object>
type=109
name=2023.08.24 17:30 AIE Cambios en la Reserva de Gas Natural
hidden=1
descr=AIE Cambios en la Reserva de Gas Natural 18 B / -8 B
color=13353215
selectable=0
date1=1692898200
</object>

<object>
type=109
name=2023.08.24 18:00 Índice Compuesto de la Actividad Manufacturera
hidden=1
descr=Índice Compuesto de la Actividad Manufacturera de la Fed de Kan
color=16119285
selectable=0
date1=1692900000
</object>

<object>
type=109
name=2023.08.24 18:00 Producción Manufacturera de la Fed de Kansas C
hidden=1
descr=Producción Manufacturera de la Fed de Kansas City
color=16119285
selectable=0
date1=1692900000
</object>

<object>
type=109
name=2023.08.24 18:30 Subasta de Letras del Tesoro a 4 Semanas
hidden=1
descr=Subasta de Letras del Tesoro a 4 Semanas
color=16119285
selectable=0
date1=1692901800
</object>

<object>
type=109
name=2023.08.24 18:30 Subasta de Letras del Tesoro a 8 Semanas
hidden=1
descr=Subasta de Letras del Tesoro a 8 Semanas
color=16119285
selectable=0
date1=1692901800
</object>

<object>
type=109
name=2023.08.24 20:00 Subasta de TIPS a 30 Años
hidden=1
descr=Subasta de TIPS a 30 Años
color=16119285
selectable=0
date1=1692907200
</object>

<object>
type=109
name=2023.08.25 17:00 Índice del Sentimiento del Consumidor de la Un
hidden=1
descr=Índice del Sentimiento del Consumidor de la Universidad de Mich
color=13353215
selectable=0
date1=1692982800
</object>

<object>
type=109
name=2023.08.25 17:00 Expectativas del Consumidor de la Universidad 
hidden=1
descr=Expectativas del Consumidor de la Universidad de Michigan 65.5 
color=13353215
selectable=0
date1=1692982800
</object>

<object>
type=109
name=2023.08.25 17:00 Condiciones Actuales de la Universidad de Mich
hidden=1
descr=Condiciones Actuales de la Universidad de Michigan 75.7 / 77.4
color=13353215
selectable=0
date1=1692982800
</object>

<object>
type=109
name=2023.08.25 17:00 Previsión de la Inflación de la Universidad de
hidden=1
descr=Previsión de la Inflación de la Universidad de Michigan 3.5% / 
color=15658671
selectable=0
date1=1692982800
</object>

<object>
type=109
name=2023.08.25 17:00 Previsión de la Inflación a 5 años de la Unive
hidden=1
descr=Previsión de la Inflación a 5 años de la Universidad de Michiga
color=15658671
selectable=0
date1=1692982800
</object>

<object>
type=109
name=2023.08.25 22:30 Posiciones Netas Especulativas de AUD de la CF
hidden=1
descr=Posiciones Netas Especulativas de AUD de la CFTC
color=16119285
selectable=0
date1=1693002600
</object>

<object>
type=109
name=2023.08.25 22:30 Posiciones Netas Especulativas de Cobre de la 
hidden=1
descr=Posiciones Netas Especulativas de Cobre de la CFTC
color=16119285
selectable=0
date1=1693002600
</object>

<object>
type=109
name=2023.08.25 22:30 Posiciones Netas Especulativas de Plata de la 
hidden=1
descr=Posiciones Netas Especulativas de Plata de la CFTC
color=16119285
selectable=0
date1=1693002600
</object>

<object>
type=109
name=2023.08.25 22:30 Posiciones Netas Especulativas de Oro de la CF
hidden=1
descr=Posiciones Netas Especulativas de Oro de la CFTC
color=16119285
selectable=0
date1=1693002600
</object>

<object>
type=109
name=2023.08.25 22:30 Posiciones Netas Especulativas de Crudo de la 
hidden=1
descr=Posiciones Netas Especulativas de Crudo de la CFTC
color=16119285
selectable=0
date1=1693002600
</object>

<object>
type=109
name=2023.08.25 22:30 Posiciones Netas Especulativas de Aluminio de 
hidden=1
descr=Posiciones Netas Especulativas de Aluminio de la CFTC
color=16119285
selectable=0
date1=1693002600
</object>

<object>
type=109
name=2023.08.25 22:30 Posiciones Netas Especulativas de Maíz de la C
hidden=1
descr=Posiciones Netas Especulativas de Maíz de la CFTC
color=16119285
selectable=0
date1=1693002600
</object>

<object>
type=109
name=2023.08.25 22:30 Posiciones Netas Especulativas de Gas Natural 
hidden=1
descr=Posiciones Netas Especulativas de Gas Natural de la CFTC
color=16119285
selectable=0
date1=1693002600
</object>

<object>
type=109
name=2023.08.25 22:30 Posiciones Netas Especulativas de Soja de la C
hidden=1
descr=Posiciones Netas Especulativas de Soja de la CFTC
color=16119285
selectable=0
date1=1693002600
</object>

<object>
type=109
name=2023.08.25 22:30 Posiciones Netas Especulativas de Trigo de la 
hidden=1
descr=Posiciones Netas Especulativas de Trigo de la CFTC
color=16119285
selectable=0
date1=1693002600
</object>

<object>
type=109
name=2023.08.25 22:30 Posiciones Netas Especulativas de Nasdaq 100 d
hidden=1
descr=Posiciones Netas Especulativas de Nasdaq 100 de la CFTC
color=16119285
selectable=0
date1=1693002600
</object>

<object>
type=109
name=2023.08.22 21:30 Discurso de la Gobernadora de la Fed, Michelle
hidden=1
descr=Discurso de la Gobernadora de la Fed, Michelle Bowman
color=16119285
selectable=0
date1=1692739800
</object>

<object>
type=109
name=2023.08.23 02:00 PMI de Manufacturación de S&P Global
hidden=1
descr=PMI de Manufacturación de S&P Global 49.4 / 49.6
color=13353215
selectable=0
date1=1692756000
</object>

<object>
type=109
name=2023.08.23 02:00 PMI de servicios de S&P Global
hidden=1
descr=PMI de servicios de S&P Global 46.7 / 47.9
color=13353215
selectable=0
date1=1692756000
</object>

<object>
type=109
name=2023.08.23 02:00 PMI de Compuesto de S&P Global
hidden=1
descr=PMI de Compuesto de S&P Global
color=16119285
selectable=0
date1=1692756000
</object>

<object>
type=109
name=2023.08.23 16:45 PMI de Manufacturación de S&P Global
hidden=1
descr=PMI de Manufacturación de S&P Global 47.0 / 50.3
color=13353215
selectable=0
date1=1692809100
</object>

<object>
type=109
name=2023.08.23 16:45 PMI de servicios de S&P Global
hidden=1
descr=PMI de servicios de S&P Global 51.0 / 52.3
color=13353215
selectable=0
date1=1692809100
</object>

<object>
type=109
name=2023.08.23 16:45 PMI de Compuesto de S&P Global
hidden=1
descr=PMI de Compuesto de S&P Global 50.4 / 52.0
color=13353215
selectable=0
date1=1692809100
</object>

<object>
type=109
name=2023.08.25 17:05 Discurso del Presidente del Sistema de la Rese
hidden=1
descr=Discurso del Presidente del Sistema de la Reserva Federal, Jero
color=16119285
selectable=0
date1=1692983100
</object>

<object>
type=109
name=2023.08.25 20:00 Recuento de Plataformas Petrolíferas de EE.UU 
hidden=1
descr=Recuento de Plataformas Petrolíferas de EE.UU de Baker Hughes
color=16119285
selectable=0
date1=1692993600
</object>

<object>
type=109
name=2023.08.25 20:00 Recuento de plataformas petrolíferas en EE.UU.
hidden=1
descr=Recuento de plataformas petrolíferas en EE.UU. de Baker Hughes
color=16119285
selectable=0
date1=1692993600
</object>

<object>
type=31
name=autotrade #28208999 buy 0.44 NZDCHF at 0.53452, NZDCHF
hidden=1
descr=EXPERTO CONTROL
color=11296515
selectable=0
date1=1691384105
value1=0.534520
</object>

<object>
type=32
name=autotrade #28314300 sell 0.44 NZDCHF at 0.53172, SL, profit -14
hidden=1
descr=[sl 0.53172]
color=1918177
selectable=0
date1=1691468496
value1=0.531720
</object>

<object>
type=31
name=autotrade #28322307 buy 1.39 NZDCHF at 0.53214, NZDCHF
hidden=1
descr=EXPERTO CONTROL
color=11296515
selectable=0
date1=1691475369
value1=0.532140
</object>

<object>
type=32
name=autotrade #28326432 sell 1.39 NZDCHF at 0.53099, SL, profit -18
hidden=1
descr=[sl 0.53099]
color=1918177
selectable=0
date1=1691481630
value1=0.530990
</object>

<object>
type=2
name=autotrade #28208999 -> #28314300, SL, profit -140.94, NZDCHF
hidden=1
descr=0.53452 -> 0.53172
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1691384105
date2=1691468496
value1=0.534520
value2=0.531720
</object>

<object>
type=2
name=autotrade #28322307 -> #28326432, SL, profit -182.97, NZDCHF
hidden=1
descr=0.53214 -> 0.53099
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1691475369
date2=1691481630
value1=0.532140
value2=0.530990
</object>

<object>
name=Line Shift Vertical Prueba
hidden=1
color=-1
selectable=0
z_order=1
ray=0
date1=1693357200
</object>

<object>
type=20
name=SSSR#R2 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1691384400
date2=1693357200
value1=0.535370
value2=0.534430
</object>

<object>
type=20
name=SSSR#R4 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1691571600
date2=1693357200
value1=0.532840
value2=0.531870
</object>

<object>
type=20
name=SSSR#R6 Strength=Verified, Test Count=3
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1692183600
date2=1693357200
value1=0.526850
value2=0.523790
</object>

<object>
type=20
name=SSSR#S9 Strength=Verified, Test Count=1
hidden=1
color=32768
background=1
selectable=0
filling=1
date1=1693180800
date2=1693357200
value1=0.522014
value2=0.519721
</object>

<object>
type=100
name=SSSR#2LBL
hidden=1
color=3937500
width=6
selectable=0
code_arrow=140
date1=1693360800
value1=0.534900
</object>

<object>
type=100
name=SSSR#4LBL
hidden=1
color=3937500
width=6
selectable=0
code_arrow=140
date1=1693360800
value1=0.532355
</object>

<object>
type=100
name=SSSR#6LBL
hidden=1
color=3937500
width=6
selectable=0
code_arrow=142
date1=1693360800
value1=0.525320
</object>

<object>
type=100
name=SSSR#9LBL
hidden=1
color=32768
width=6
selectable=0
code_arrow=140
date1=1693360800
value1=0.520867
</object>

</window>

<window>
height=13.690205
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

<window>
height=14.490893
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
</chart>