<chart>
id=132987574665684733
symbol=USDJPY
description=US Dollar vs Japanese Yen
period_type=0
period_size=20
digits=3
tick_size=0.000000
position_time=1654636800
scale_fix=0
scale_fixed_min=132.940000
scale_fixed_max=135.230000
scale_fix11=0
scale_bar=0
scale_bar_val=1.000000
scale=8
mode=1
fore=0
grid=0
volume=1
scroll=0
shift=1
shift_size=19.494585
fixed_pos=0.000000
ticker=1
ohlc=0
one_click=0
one_click_btn=1
bidline=1
askline=1
lastline=0
days=1
descriptions=0
tradelines=1
tradehistory=1
window_left=156
window_top=156
window_right=2112
window_bottom=781
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
chartline_color=65280
volumes_color=3329330
grid_color=10061943
bidline_color=10061943
askline_color=255
lastline_color=65535
stops_color=255
windows_total=1

<window>
height=161.662338
objects=89

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
path=Indicators\INDICADOR PATRONES PRO\PATRONES ANTIGUO CON PERSONALIZED.ex5
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

<graph>
name=ner up zone P1
draw=0
style=0
width=1
arrow=251
color=
</graph>

<graph>
name=ner up zone P2
draw=0
style=0
width=1
arrow=251
color=
</graph>

<graph>
name=ner dn zone P1
draw=0
style=0
width=1
arrow=251
color=
</graph>

<graph>
name=ner dn zone P2
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
arrow=251
color=
</graph>

<graph>
name=BUY P
draw=3
style=0
width=4
arrow=233
color=16776960
</graph>

<graph>
name=SELL P
draw=3
style=0
width=4
arrow=234
color=16776960
</graph>

<graph>
name=
draw=0
style=0
width=1
arrow=251
color=
</graph>
<inputs>
Espera=8
VelasEvaluadas=50000
Testeado=2
Repintado=false
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
Activar_Alerta_Confirmacion=false
Activar_Alerta=false
Audio_Alerta_Confirmacion=alert2
AlertPC=false
AlertMovil=false
AlertMail=false
S1__=-----------------------   Configuracion SOP RES---------------------
Ver_Sop_Res=true
BackLimit=150
S111__=-----------------------   Configuracion TREND FORCE--------------------
trendPeriod=5
TriggerUp=0.8
TriggerDown=-0.8
pus1=/////////////////////////////////////////////////
zone_show_weak=true
zone_show_untested=true
zone_show_turncoat=true
zone_fuzzfactor=1.5
SeparacionTexto=10
Conector=false
S12_============================================= CONFIGURACION TREND ============================================
inpFastLength=30
inpSlowLength=50
Tolerancia_Personalized=0
EsperarConfirmacion=5
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
inpFastLength=30
inpSlowLength=50
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
Periodos=100
</inputs>
</indicator>
<object>
type=109
name=2022.05.02 16:45 PMI de Manufacturación de S&P Global
hidden=1
descr=PMI de Manufacturación de S&P Global 59.2 / 59.7
color=13353215
selectable=0
date1=1651509900
</object>

<object>
type=109
name=2022.05.02 17:00 Gasto en Construcción m/m
hidden=1
descr=Gasto en Construcción m/m 0.1% / 0.1%
color=16119285
selectable=0
date1=1651510800
</object>

<object>
type=109
name=2022.05.02 17:00 PMI manufacturero del ISM
hidden=1
descr=PMI manufacturero del ISM 55.4 / 57.9
color=13353215
selectable=0
date1=1651510800
</object>

<object>
type=109
name=2022.05.02 17:00 Índice de precios en el sector manufacturero d
hidden=1
descr=Índice de precios en el sector manufacturero de ISM 84.6 / 81.7
color=15658671
selectable=0
date1=1651510800
</object>

<object>
type=109
name=2022.05.02 17:00 ISM Empleo Manufacturero
hidden=1
descr=ISM Empleo Manufacturero 50.9 / 54.7
color=13353215
selectable=0
date1=1651510800
</object>

<object>
type=109
name=2022.05.02 17:00 ISM Nuevos Pedidos en la Industria Manufacture
hidden=1
descr=ISM Nuevos Pedidos en la Industria Manufacturera 53.5 / 57.7
color=13353215
selectable=0
date1=1651510800
</object>

<object>
type=109
name=2022.05.02 18:30 Subasta de Letras del Tesoro a 3 Meses
hidden=1
descr=Subasta de Letras del Tesoro a 3 Meses
color=16119285
selectable=0
date1=1651516200
</object>

<object>
type=109
name=2022.05.02 18:30 Subasta de Letras del Tesoro a 6 Meses
hidden=1
descr=Subasta de Letras del Tesoro a 6 Meses
color=16119285
selectable=0
date1=1651516200
</object>

<object>
type=109
name=2022.05.03 17:00 Pedidos Industriales m/m
hidden=1
descr=Pedidos Industriales m/m 2.2% / -0.1%
color=15658671
selectable=0
date1=1651597200
</object>

<object>
type=109
name=2022.05.03 17:00 Pedidos Industriales excl. Transporte m/m
hidden=1
descr=Pedidos Industriales excl. Transporte m/m 2.5% / -0.2%
color=15658671
selectable=0
date1=1651597200
</object>

<object>
type=109
name=2022.05.03 17:00 Envíos de Bienes de Capital no Relacionados co
hidden=1
descr=Envíos de Bienes de Capital no Relacionados con la Defensa excl
color=15658671
selectable=0
date1=1651597200
</object>

<object>
type=109
name=2022.05.03 17:00 Índice JOLTS de puestos de trabajo vacantes
hidden=1
descr=Índice JOLTS de puestos de trabajo vacantes 11.549 M / 11.587 M
color=13353215
selectable=0
date1=1651597200
</object>

<object>
type=109
name=2022.05.04 15:15 Cambio del Empleo no Agrícola ADP
hidden=1
descr=Cambio del Empleo no Agrícola ADP 247 K / -31 K
color=15658671
selectable=0
date1=1651677300
</object>

<object>
type=109
name=2022.05.04 15:30 Balance Comercial
hidden=1
descr=Balance Comercial $-109.802 B / $-90.055 B
color=13353215
selectable=0
date1=1651678200
</object>

<object>
type=109
name=2022.05.04 15:30 Exportaciones
hidden=1
descr=Exportaciones
color=16119285
selectable=0
date1=1651678200
</object>

<object>
type=109
name=2022.05.04 15:30 Importaciones
hidden=1
descr=Importaciones
color=16119285
selectable=0
date1=1651678200
</object>

<object>
type=109
name=2022.05.04 16:45 PMI de servicios de S&P Global
hidden=1
descr=PMI de servicios de S&P Global 55.6 / 54.7
color=15658671
selectable=0
date1=1651682700
</object>

<object>
type=109
name=2022.05.04 16:45 PMI de Compuesto de S&P Global
hidden=1
descr=PMI de Compuesto de S&P Global 56.0 / 55.1
color=15658671
selectable=0
date1=1651682700
</object>

<object>
type=109
name=2022.05.04 17:00 ISM no Manufacturero del PMI
hidden=1
descr=ISM no Manufacturero del PMI 57.1 / 62.7
color=13353215
selectable=0
date1=1651683600
</object>

<object>
type=109
name=2022.05.04 17:00 ISM Empleo en la Industria no Manufacturera
hidden=1
descr=ISM Empleo en la Industria no Manufacturera 49.5 / 51.2
color=13353215
selectable=0
date1=1651683600
</object>

<object>
type=109
name=2022.05.04 17:00 ISM Nuevos Pedidos en la Industria no Manufact
hidden=1
descr=ISM Nuevos Pedidos en la Industria no Manufacturera 54.6 / 64.3
color=13353215
selectable=0
date1=1651683600
</object>

<object>
type=109
name=2022.05.04 17:00 Índice de Precios de la Industria no Manufactu
hidden=1
descr=Índice de Precios de la Industria no Manufacturera de ISM 84.6 
color=15658671
selectable=0
date1=1651683600
</object>

<object>
type=109
name=2022.05.04 17:00 ISM Actividad Comercial en la Industria no Man
hidden=1
descr=ISM Actividad Comercial en la Industria no Manufacturera 59.1 /
color=13353215
selectable=0
date1=1651683600
</object>

<object>
type=109
name=2022.05.04 17:30 AIE Cambio en las Reservas de Crudo
hidden=1
descr=AIE Cambio en las Reservas de Crudo 1.303 M / -0.101 M
color=13353215
selectable=0
date1=1651685400
</object>

<object>
type=109
name=2022.05.04 17:30 AIE Cambio en las Reservas de Crudo en Cushing
hidden=1
descr=AIE Cambio en las Reservas de Crudo en Cushing 1.379 M / -0.628
color=13353215
selectable=0
date1=1651685400
</object>

<object>
type=109
name=2022.05.04 17:30 AIE Cambio en la Importación de Petróleo
hidden=1
descr=AIE Cambio en la Importación de Petróleo 0.545 M / 0.173 M
color=13353215
selectable=0
date1=1651685400
</object>

<object>
type=109
name=2022.05.04 17:30 AIE Cambio en la Producción de Combustible Des
hidden=1
descr=AIE Cambio en la Producción de Combustible Destilado -0.063 M /
color=15658671
selectable=0
date1=1651685400
</object>

<object>
type=109
name=2022.05.04 17:30 AIE Cambio en las Reservas de Combustible Dest
hidden=1
descr=AIE Cambio en las Reservas de Combustible Destilado -2.344 M / 
color=15658671
selectable=0
date1=1651685400
</object>

<object>
type=109
name=2022.05.04 17:30 AIE Cambio en la Producción de Gasolina
hidden=1
descr=AIE Cambio en la Producción de Gasolina 0.175 M / 0.251 M
color=15658671
selectable=0
date1=1651685400
</object>

<object>
type=109
name=2022.05.04 17:30 AIE Cambio en las Reservas de Combustible para
hidden=1
descr=AIE Cambio en las Reservas de Combustible para Calefacción 0.19
color=13353215
selectable=0
date1=1651685400
</object>

<object>
type=109
name=2022.05.04 17:30 AIE Cambios en las Reservas de Gasolina
hidden=1
descr=AIE Cambios en las Reservas de Gasolina -2.230 M / -0.005 M
color=15658671
selectable=0
date1=1651685400
</object>

<object>
type=109
name=2022.05.04 17:30 Cambio de Entradas Diarias de Petróleo Crudo d
hidden=1
descr=Cambio de Entradas Diarias de Petróleo Crudo de Refinería de la
color=16119285
selectable=0
date1=1651685400
</object>

<object>
type=109
name=2022.05.04 17:30 Cambio en la Tasa de Utilización de las Refine
hidden=1
descr=Cambio en la Tasa de Utilización de las Refinerías de la EIA
color=16119285
selectable=0
date1=1651685400
</object>

<object>
type=109
name=2022.05.04 21:00 Declaración del CFMA
hidden=1
descr=Declaración del CFMA
color=16119285
selectable=0
date1=1651698000
</object>

<object>
type=109
name=2022.05.04 21:00 Decisión de la Tasa de Interés de la Reserva F
hidden=1
descr=Decisión de la Tasa de Interés de la Reserva Federal
color=16119285
selectable=0
date1=1651698000
</object>

<object>
type=109
name=2022.05.04 21:30 Conferencia de Prensa del FOMC
hidden=1
descr=Conferencia de Prensa del FOMC
color=16119285
selectable=0
date1=1651699800
</object>

<object>
type=109
name=2022.05.05 14:30 Número de Despidos de Challenger
hidden=1
descr=Número de Despidos de Challenger
color=16119285
selectable=0
date1=1651761000
</object>

<object>
type=109
name=2022.05.05 14:30 Número de Despidos de Challenger a/a
hidden=1
descr=Número de Despidos de Challenger a/a 6.0% / -53.0%
color=13353215
selectable=0
date1=1651761000
</object>

<object>
type=109
name=2022.05.05 15:30 Productivdad no agraria t/t
hidden=1
descr=Productivdad no agraria t/t -7.5% / 3.3%
color=13353215
selectable=0
date1=1651764600
</object>

<object>
type=109
name=2022.05.05 15:30 Costes Laborales Unitarios t/t
hidden=1
descr=Costes Laborales Unitarios t/t 11.6% / 3.2%
color=15658671
selectable=0
date1=1651764600
</object>

<object>
type=109
name=2022.05.05 15:30 Peticiones Iniciales del Subsidio de Desempleo
hidden=1
descr=Peticiones Iniciales del Subsidio de Desempleo 200 K / 176 K
color=13353215
selectable=0
date1=1651764600
</object>

<object>
type=109
name=2022.05.05 15:30 Peticiones Continuas del Subsidio de Desempleo
hidden=1
descr=Peticiones Continuas del Subsidio de Desempleo 1.384 M / 1.465 
color=15658671
selectable=0
date1=1651764600
</object>

<object>
type=109
name=2022.05.05 15:30 Número Medio de Peticiones Iniciales del Subsi
hidden=1
descr=Número Medio de Peticiones Iniciales del Subsidio de Desempleo 
color=15658671
selectable=0
date1=1651764600
</object>

<object>
type=109
name=2022.05.05 17:30 AIE Cambios en la Reserva de Gas Natural
hidden=1
descr=AIE Cambios en la Reserva de Gas Natural 77 B / 46 B
color=13353215
selectable=0
date1=1651771800
</object>

<object>
type=109
name=2022.05.05 18:30 Subasta de Letras del Tesoro a 4 Semanas
hidden=1
descr=Subasta de Letras del Tesoro a 4 Semanas
color=16119285
selectable=0
date1=1651775400
</object>

<object>
type=109
name=2022.05.05 18:30 Subasta de Letras del Tesoro a 8 Semanas
hidden=1
descr=Subasta de Letras del Tesoro a 8 Semanas
color=16119285
selectable=0
date1=1651775400
</object>

<object>
type=109
name=2022.05.06 15:30 Tasa de Desempleo
hidden=1
descr=Tasa de Desempleo 3.6% / 3.7%
color=15658671
selectable=0
date1=1651851000
</object>

<object>
type=109
name=2022.05.06 15:30 Cambio en el empleo no agrícola
hidden=1
descr=Cambio en el empleo no agrícola 428 K / 317 K
color=15658671
selectable=0
date1=1651851000
</object>

<object>
type=109
name=2022.05.06 15:30 Tasa de Participación
hidden=1
descr=Tasa de Participación 62.2% / 62.3%
color=13353215
selectable=0
date1=1651851000
</object>

<object>
type=109
name=2022.05.06 15:30 Ganancias Promedio por Hora m/m
hidden=1
descr=Ganancias Promedio por Hora m/m 0.3% / 0.4%
color=13353215
selectable=0
date1=1651851000
</object>

<object>
type=109
name=2022.05.06 15:30 Ganancias Promedio por Hora a/a
hidden=1
descr=Ganancias Promedio por Hora a/a 5.5% / 5.4%
color=15658671
selectable=0
date1=1651851000
</object>

<object>
type=109
name=2022.05.06 15:30 Promedio de Horas Semanales
hidden=1
descr=Promedio de Horas Semanales 34.6 / 34.6
color=16119285
selectable=0
date1=1651851000
</object>

<object>
type=109
name=2022.05.06 15:30 Nóminas Gubernamentales
hidden=1
descr=Nóminas Gubernamentales 22 K / -45 K
color=15658671
selectable=0
date1=1651851000
</object>

<object>
type=109
name=2022.05.06 15:30 Nóminas no Agrícolas Privadas
hidden=1
descr=Nóminas no Agrícolas Privadas 406 K / -89 K
color=15658671
selectable=0
date1=1651851000
</object>

<object>
type=109
name=2022.05.06 15:30 U6 Tasa de Desempleo
hidden=1
descr=U6 Tasa de Desempleo 7.0% / 7.0%
color=16119285
selectable=0
date1=1651851000
</object>

<object>
type=109
name=2022.05.06 15:30 Cambio en el Empleo Manufacturero
hidden=1
descr=Cambio en el Empleo Manufacturero 55 K / 11 K
color=15658671
selectable=0
date1=1651851000
</object>

<object>
type=109
name=2022.05.06 16:15 Discurso del Miembro del FOMC, John Williams
hidden=1
descr=Discurso del Miembro del FOMC, John Williams
color=16119285
selectable=0
date1=1651853700
</object>

<object>
type=109
name=2022.05.06 20:00 Recuento de Plataformas Petrolíferas de EE.UU 
hidden=1
descr=Recuento de Plataformas Petrolíferas de EE.UU de Baker Hughes
color=16119285
selectable=0
date1=1651867200
</object>

<object>
type=109
name=2022.05.06 20:00 Recuento de plataformas petrolíferas en EE.UU.
hidden=1
descr=Recuento de plataformas petrolíferas en EE.UU. de Baker Hughes
color=16119285
selectable=0
date1=1651867200
</object>

<object>
type=109
name=2022.05.06 22:00 Crédito al Consumo de la FRS m/m
hidden=1
descr=Crédito al Consumo de la FRS m/m $52.43 B / $24.38 B
color=15658671
selectable=0
date1=1651874400
</object>

<object>
type=109
name=2022.05.06 22:30 Posiciones Netas Especulativas de Cobre de la 
hidden=1
descr=Posiciones Netas Especulativas de Cobre de la CFTC
color=16119285
selectable=0
date1=1651876200
</object>

<object>
type=109
name=2022.05.06 22:30 Posiciones Netas Especulativas de Plata de la 
hidden=1
descr=Posiciones Netas Especulativas de Plata de la CFTC
color=16119285
selectable=0
date1=1651876200
</object>

<object>
type=109
name=2022.05.06 22:30 Posiciones Netas Especulativas de Oro de la CF
hidden=1
descr=Posiciones Netas Especulativas de Oro de la CFTC
color=16119285
selectable=0
date1=1651876200
</object>

<object>
type=109
name=2022.05.06 22:30 Posiciones Netas Especulativas de Crudo de la 
hidden=1
descr=Posiciones Netas Especulativas de Crudo de la CFTC
color=16119285
selectable=0
date1=1651876200
</object>

<object>
type=109
name=2022.05.06 22:30 Posiciones Netas Especulativas de Aluminio de 
hidden=1
descr=Posiciones Netas Especulativas de Aluminio de la CFTC
color=16119285
selectable=0
date1=1651876200
</object>

<object>
type=109
name=2022.05.06 22:30 Posiciones Netas Especulativas de Maíz de la C
hidden=1
descr=Posiciones Netas Especulativas de Maíz de la CFTC
color=16119285
selectable=0
date1=1651876200
</object>

<object>
type=109
name=2022.05.06 22:30 Posiciones Netas Especulativas de Gas Natural 
hidden=1
descr=Posiciones Netas Especulativas de Gas Natural de la CFTC
color=16119285
selectable=0
date1=1651876200
</object>

<object>
type=109
name=2022.05.06 22:30 Posiciones Netas Especulativas de Soja de la C
hidden=1
descr=Posiciones Netas Especulativas de Soja de la CFTC
color=16119285
selectable=0
date1=1651876200
</object>

<object>
type=109
name=2022.05.06 22:30 Posiciones Netas Especulativas de Trigo de la 
hidden=1
descr=Posiciones Netas Especulativas de Trigo de la CFTC
color=16119285
selectable=0
date1=1651876200
</object>

<object>
type=109
name=2022.05.06 22:30 Posiciones Netas Especulativas de Nasdaq 100 d
hidden=1
descr=Posiciones Netas Especulativas de Nasdaq 100 de la CFTC
color=16119285
selectable=0
date1=1651876200
</object>

<object>
type=109
name=2022.05.07 02:15 Fed Governor Waller Speech
hidden=1
descr=Fed Governor Waller Speech
color=16119285
selectable=0
date1=1651889700
</object>

<object>
type=109
name=2022.05.02 10:00 Clima del Consumo
hidden=1
descr=Clima del Consumo -27 / 0
color=13353215
selectable=0
date1=1651485600
</object>

<object>
type=109
name=2022.05.02 10:30 PMI de la Manufactura de procure.ch
hidden=1
descr=PMI de la Manufactura de procure.ch 62.5 / 63.9
color=13353215
selectable=0
date1=1651487400
</object>

<object>
type=109
name=2022.05.05 09:30 IPC m/m
hidden=1
descr=IPC m/m 0.4% / 0.2%
color=15658671
selectable=0
date1=1651743000
</object>

<object>
type=109
name=2022.05.05 09:30 IPC a/a
hidden=1
descr=IPC a/a 2.5% / 2.5%
color=16119285
selectable=0
date1=1651743000
</object>

<object>
type=109
name=2022.05.06 08:45 Tasa de Desempleo
hidden=1
descr=Tasa de Desempleo 2.2% / 2.1%
color=13353215
selectable=0
date1=1651826700
</object>

<object>
type=109
name=2022.05.06 08:45 Tasa de Desempleo no ajustado a variaciones es
hidden=1
descr=Tasa de Desempleo no ajustado a variaciones estacionales 2.3% /
color=16119285
selectable=0
date1=1651826700
</object>

<object>
type=109
name=2022.05.06 10:00 Reservas de Moneda Extranjera
hidden=1
descr=Reservas de Moneda Extranjera
color=16119285
selectable=0
date1=1651831200
</object>

<object>
type=109
name=2022.05.06 22:30 Posiciones Netas Especulativas de CHF de la CF
hidden=1
descr=Posiciones Netas Especulativas de CHF de la CFTC
color=16119285
selectable=0
date1=1651876200
</object>

<object>
name=M5 Vertical Line 3679
color=65407
width=2
ray=1
date1=1643595900
</object>

<object>
name=M5 Vertical Line 64989
color=16711935
width=2
ray=1
date1=1636026000
</object>

<object>
type=20
name=SSSR#S0 Strength=Verified, Test Count=1
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1654856400
date2=1655140800
value1=133.870214
value2=133.208429
</object>

<object>
type=20
name=SSSR#R1 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1654874400
date2=1655140800
value1=134.522000
value2=134.116000
</object>

<object>
type=20
name=SSSR#R2 Strength=Untested
hidden=1
color=13850042
background=1
selectable=0
filling=1
date1=1655103600
date2=1655140800
value1=135.301000
value2=134.993000
</object>

<object>
type=20
name=SSSR#R3 Strength=Weak
hidden=1
color=14053594
background=1
selectable=0
filling=1
date1=1655128800
date2=1655140800
value1=134.817000
value2=134.579000
</object>

<object>
type=101
name=SSSR#0LBL
hidden=1
descr=Verificado Soporte, Retesteado=1    
color=16777215
selectable=0
angle=0
date1=1655149564
value1=133.539321
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#1LBL
hidden=1
descr=Roto Resistencia                    
color=16777215
selectable=0
angle=0
date1=1655149452
value1=134.319000
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#2LBL
hidden=1
descr=No Probado Resistencia              
color=16777215
selectable=0
angle=0
date1=1655149494
value1=135.147000
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#3LBL
hidden=1
descr=Debil Resistencia                   
color=16777215
selectable=0
angle=0
date1=1655149459
value1=134.698000
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

</window>
</chart>