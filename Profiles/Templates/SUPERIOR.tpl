<chart>
id=132979588007070517
symbol=GBPUSD
description=Great Britain Pound vs US Dollar
period_type=0
period_size=15
digits=5
tick_size=0.000000
position_time=0
scale_fix=0
scale_fixed_min=1.245400
scale_fixed_max=1.260500
scale_fix11=0
scale_bar=0
scale_bar_val=1.000000
scale=4
mode=1
fore=0
grid=0
volume=1
scroll=0
shift=1
shift_size=19.272126
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
window_left=0
window_top=0
window_right=0
window_bottom=0
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
chartline_color=65280
volumes_color=3329330
grid_color=10061943
bidline_color=10061943
askline_color=255
lastline_color=65535
stops_color=255
windows_total=1

<window>
height=100.000000
objects=261

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
path=Experts\MI PANEL ANGELO PRO FINAL.ex5::Indicators\INDICADOR PATRONES PRO\EMA_COLOR.ex5
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
expertmode=536871936
fixed_height=-1

<graph>
name=EMA FAST
draw=1
style=0
width=1
arrow=251
color=65535
</graph>
<inputs>
Periodo=50
Shift_MA=0
APP_MA=1
MODE_MA=0
Label=EMA FAST
Grosor=1
Estilo=0
Color=65535
</inputs>
</indicator>

<indicator>
name=Custom Indicator
path=Experts\MI PANEL ANGELO PRO FINAL.ex5::Indicators\INDICADOR PATRONES PRO\EMA_COLOR.ex5
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
expertmode=536871936
fixed_height=-1

<graph>
name=EMA SLOW
draw=1
style=0
width=2
arrow=251
color=16777215
</graph>
<inputs>
Periodo=150
Shift_MA=0
APP_MA=1
MODE_MA=0
Label=EMA SLOW
Grosor=2
Estilo=0
Color=16777215
</inputs>
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\ENCUADRADO.ex5
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
<inputs>
EvaluaBarras=5000
S111__=-----------------------   Configuracion TREND FORCE--------------------
trendPeriod=20
TriggerUp=0.1
TriggerDown=-0.1
</inputs>
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
Espera=11
VelasEvaluadas=1000
Testeado=0
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
BackLimit=3000
S111__=-----------------------   Configuracion TREND FORCE--------------------
trendPeriod=4
TriggerUp=0.4
TriggerDown=-0.4
pus1=/////////////////////////////////////////////////
zone_show_weak=true
zone_show_untested=true
zone_show_turncoat=true
zone_fuzzfactor=0.75
SeparacionTexto=10
Conector=false
S12_============================================= CONFIGURACION TREND ============================================
inpFastLength=7
inpSlowLength=15
Tolerancia_Personalized=0
EsperarConfirmacion=4
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
inpFastLength=7
inpSlowLength=15
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
name=M30 Vertical Line 47868
color=3329330
ray=1
date1=1645412340
</object>

<object>
type=32
name=autotrade #42727322 sell 0.1 GBPUSD at 1.32490
hidden=1
color=1918177
selectable=0
date1=1639581837
value1=1.324900
</object>

<object>
type=31
name=autotrade #42742698 buy 0.1 GBPUSD at 1.32239
hidden=1
descr=[sl 1.32238]
color=11296515
selectable=0
date1=1639588266
value1=1.322390
</object>

<object>
type=32
name=autotrade #42928272 sell 0.1 GBPUSD at 1.32799
hidden=1
color=1918177
selectable=0
date1=1639759572
value1=1.327990
</object>

<object>
type=31
name=autotrade #42940847 buy 0.1 GBPUSD at 1.32683
hidden=1
descr=[sl 1.32680]
color=11296515
selectable=0
date1=1639764953
value1=1.326830
</object>

<object>
type=32
name=autotrade #43027517 sell 0.1 GBPUSD at 1.32199
hidden=1
color=1918177
selectable=0
date1=1640021870
value1=1.321990
</object>

<object>
type=31
name=autotrade #43033685 buy 0.1 GBPUSD at 1.32170
hidden=1
descr=[sl 1.32165]
color=11296515
selectable=0
date1=1640026358
value1=1.321700
</object>

<object>
type=32
name=autotrade #43101508 sell 0.1 GBPUSD at 1.32337
hidden=1
color=1918177
selectable=0
date1=1640106353
value1=1.323370
</object>

<object>
type=31
name=autotrade #43111628 buy 0.1 GBPUSD at 1.32517
hidden=1
descr=[sl 1.32516]
color=11296515
selectable=0
date1=1640110809
value1=1.325170
</object>

<object>
type=31
name=autotrade #45497115 buy 0.1 GBPUSD at 1.33992
hidden=1
color=11296515
selectable=0
date1=1643383856
value1=1.339920
</object>

<object>
type=32
name=autotrade #45519114 sell 0.1 GBPUSD at 1.34039
hidden=1
descr=[sl 1.34039]
color=1918177
selectable=0
date1=1643390708
value1=1.340390
</object>

<object>
type=31
name=autotrade #63295876 buy 0.01 GBPUSD at 1.25740
hidden=1
color=11296515
selectable=0
date1=1653338615
value1=1.257400
</object>

<object>
type=32
name=autotrade #63306284 sell 0.01 GBPUSD at 1.25737
hidden=1
descr=[sl 1.25741]
color=1918177
selectable=0
date1=1653343949
value1=1.257370
</object>

<object>
type=31
name=autotrade #63612485 buy 0.02 GBPUSD at 1.25181
hidden=1
color=11296515
selectable=0
date1=1653496050
value1=1.251810
</object>

<object>
type=2
name=autotrade #42727322 -> #42742698 GBPUSD
hidden=1
descr=1.32490 -> 1.32239
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1639581837
date2=1639588266
value1=1.324900
value2=1.322390
</object>

<object>
type=2
name=autotrade #42928272 -> #42940847 GBPUSD
hidden=1
descr=1.32799 -> 1.32683
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1639759572
date2=1639764953
value1=1.327990
value2=1.326830
</object>

<object>
type=2
name=autotrade #43027517 -> #43033685 GBPUSD
hidden=1
descr=1.32199 -> 1.32170
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1640021870
date2=1640026358
value1=1.321990
value2=1.321700
</object>

<object>
type=2
name=autotrade #43101508 -> #43111628 GBPUSD
hidden=1
descr=1.32337 -> 1.32517
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1640106353
date2=1640110809
value1=1.323370
value2=1.325170
</object>

<object>
type=2
name=autotrade #45497115 -> #45519114 GBPUSD
hidden=1
descr=1.33992 -> 1.34039
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1643383856
date2=1643390708
value1=1.339920
value2=1.340390
</object>

<object>
type=2
name=autotrade #63295876 -> #63306284 GBPUSD
hidden=1
descr=1.25740 -> 1.25737
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1653338615
date2=1653343949
value1=1.257400
value2=1.257370
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H11
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652248800
date2=1652260500
value1=1.234110
value2=1.234110
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L11
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652248800
date2=1652260500
value1=1.232540
value2=1.232540
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H5
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653473700
date2=1653480000
value1=1.255550
value2=1.255550
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L5
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653473700
date2=1653480000
value1=1.252020
value2=1.252020
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H19
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1647919800
date2=1647938700
value1=1.315440
value2=1.315440
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L19
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1647919800
date2=1647938700
value1=1.312530
value2=1.312530
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H1
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653471000
date2=1653473700
value1=1.255990
value2=1.255990
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L1
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653471000
date2=1653473700
value1=1.253900
value2=1.253900
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H22
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652943600
date2=1652965200
value1=1.240730
value2=1.240730
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L22
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652943600
date2=1652965200
value1=1.233820
value2=1.233820
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H13
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653050700
date2=1653064200
value1=1.250020
value2=1.250020
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L13
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653050700
date2=1653064200
value1=1.246120
value2=1.246120
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H58
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653314400
date2=1653368400
value1=1.259360
value2=1.259360
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L58
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653314400
date2=1653368400
value1=1.255560
value2=1.255560
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H9
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652447700
date2=1652457600
value1=1.221660
value2=1.221660
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L9
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652447700
date2=1652457600
value1=1.218320
value2=1.218320
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H29
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1647488700
date2=1647514800
value1=1.318090
value2=1.318090
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L29
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1647488700
date2=1647514800
value1=1.313420
value2=1.313420
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H10
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652273100
date2=1652283900
value1=1.236870
value2=1.236870
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L10
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652273100
date2=1652283900
value1=1.227890
value2=1.227890
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H60
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1650648600
date2=1650877200
value1=1.285650
value2=1.285650
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L60
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1650648600
date2=1650877200
value1=1.279210
value2=1.279210
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H8
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652286600
date2=1652295600
value1=1.238970
value2=1.238970
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L8
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652286600
date2=1652295600
value1=1.231360
value2=1.231360
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H2
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653388200
date2=1653391800
value1=1.259210
value2=1.259210
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L2
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653388200
date2=1653391800
value1=1.256550
value2=1.256550
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H59
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652111100
date2=1652166000
value1=1.238060
value2=1.238060
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L59
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652111100
date2=1652166000
value1=1.230090
value2=1.230090
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H31
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1647891900
date2=1647919800
value1=1.320220
value2=1.320220
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L31
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1647891900
date2=1647919800
value1=1.314580
value2=1.314580
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H3
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653300000
date2=1653304500
value1=1.257150
value2=1.257150
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L3
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653300000
date2=1653304500
value1=1.254740
value2=1.254740
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H64
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652992200
date2=1653051600
value1=1.251220
value2=1.251220
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L64
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652992200
date2=1653051600
value1=1.243780
value2=1.243780
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H61
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1649438100
date2=1649667600
value1=1.303980
value2=1.303980
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L61
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1649438100
date2=1649667600
value1=1.300210
value2=1.300210
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H7
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653080400
date2=1653088500
value1=1.249140
value2=1.249140
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L7
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653080400
date2=1653088500
value1=1.245330
value2=1.245330
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H51
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1648663200
date2=1648710900
value1=1.316490
value2=1.316490
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L51
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1648663200
date2=1648710900
value1=1.311430
value2=1.311430
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H57
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1649683800
date2=1649736900
value1=1.304820
value2=1.304820
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L57
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1649683800
date2=1649736900
value1=1.301030
value2=1.301030
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H6
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1651144500
date2=1651151700
value1=1.255030
value2=1.255030
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L6
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1651144500
date2=1651151700
value1=1.250420
value2=1.250420
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H68
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1648492200
date2=1648553400
value1=1.311560
value2=1.311560
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L68
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1648492200
date2=1648553400
value1=1.307830
value2=1.307830
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H53
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1648589400
date2=1648637100
value1=1.313410
value2=1.313410
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L53
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1648589400
date2=1648637100
value1=1.308040
value2=1.308040
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H12
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1649858400
date2=1649871000
value1=1.302710
value2=1.302710
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L12
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1649858400
date2=1649871000
value1=1.299050
value2=1.299050
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H27
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652345100
date2=1652371200
value1=1.224770
value2=1.224770
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L27
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652345100
date2=1652371200
value1=1.216530
value2=1.216530
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H4
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653089400
date2=1653267600
value1=1.248470
value2=1.248470
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L4
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653089400
date2=1653267600
value1=1.246960
value2=1.246960
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H46
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1648845900
date2=1649060100
value1=1.312100
value2=1.312100
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L46
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1648845900
date2=1649060100
value1=1.308220
value2=1.308220
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H17
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652370300
date2=1652387400
value1=1.224330
value2=1.224330
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L17
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652370300
date2=1652387400
value1=1.218490
value2=1.218490
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H44
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1649205000
date2=1649246400
value1=1.309850
value2=1.309850
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L44
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1649205000
date2=1649246400
value1=1.304550
value2=1.304550
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H33
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652391000
date2=1652422500
value1=1.222000
value2=1.222000
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L33
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652391000
date2=1652422500
value1=1.217440
value2=1.217440
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H49
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1649280600
date2=1649324700
value1=1.309310
value2=1.309310
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L49
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1649280600
date2=1649324700
value1=1.305440
value2=1.305440
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H25
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652673600
date2=1652697900
value1=1.228040
value2=1.228040
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L25
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652673600
date2=1652697900
value1=1.221730
value2=1.221730
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H54
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1649360700
date2=1649409300
value1=1.308570
value2=1.308570
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L54
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1649360700
date2=1649409300
value1=1.305400
value2=1.305400
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H20
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1650439800
date2=1650459600
value1=1.304150
value2=1.304150
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L20
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1650439800
date2=1650459600
value1=1.299630
value2=1.299630
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H24
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652697000
date2=1652720400
value1=1.227040
value2=1.227040
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L24
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652697000
date2=1652720400
value1=1.221890
value2=1.221890
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H14
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1649845800
date2=1649858400
value1=1.301590
value2=1.301590
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L14
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1649845800
date2=1649858400
value1=1.299010
value2=1.299010
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H62
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1650894300
date2=1650951900
value1=1.275970
value2=1.275970
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L62
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1650894300
date2=1650951900
value1=1.269730
value2=1.269730
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H116
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1649961900
date2=1650066300
value1=1.308260
value2=1.308260
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L116
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1649961900
date2=1650066300
value1=1.304400
value2=1.304400
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H39
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1650389400
date2=1650426300
value1=1.301820
value2=1.301820
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L39
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1650389400
date2=1650426300
value1=1.298720
value2=1.298720
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H56
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1650472200
date2=1650522600
value1=1.307380
value2=1.307380
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L56
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1650472200
date2=1650522600
value1=1.303440
value2=1.303440
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H37
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1650584700
date2=1650618000
value1=1.303510
value2=1.303510
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L37
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1650584700
date2=1650618000
value1=1.301080
value2=1.301080
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H16
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653370200
date2=1653386400
value1=1.258870
value2=1.258870
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L16
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653370200
date2=1653386400
value1=1.255620
value2=1.255620
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H63
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1651083300
date2=1651140000
value1=1.257380
value2=1.257380
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L63
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1651083300
date2=1651140000
value1=1.249130
value2=1.249130
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H23
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1651241700
date2=1651262400
value1=1.258660
value2=1.258660
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L23
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1651241700
date2=1651262400
value1=1.253030
value2=1.253030
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H73
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1651266900
date2=1651505400
value1=1.260280
value2=1.260280
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L73
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1651266900
date2=1651505400
value1=1.253980
value2=1.253980
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H50
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1651712400
date2=1651759200
value1=1.263300
value2=1.263300
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L50
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1651712400
date2=1651759200
value1=1.251770
value2=1.251770
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H122
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1651783500
date2=1652066100
value1=1.238030
value2=1.238030
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L122
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1651783500
date2=1652066100
value1=1.227600
value2=1.227600
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H18
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653063300
date2=1653081300
value1=1.249520
value2=1.249520
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L18
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653063300
date2=1653081300
value1=1.245270
value2=1.245270
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H38
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652213700
date2=1652247900
value1=1.233810
value2=1.233810
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L38
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652213700
date2=1652247900
value1=1.230290
value2=1.230290
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H26
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652321700
date2=1652345100
value1=1.224850
value2=1.224850
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L26
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652321700
date2=1652345100
value1=1.219740
value2=1.219740
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H32
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652750100
date2=1652778900
value1=1.236500
value2=1.236500
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L32
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652750100
date2=1652778900
value1=1.231890
value2=1.231890
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H70
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652802300
date2=1652865300
value1=1.250080
value2=1.250080
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L70
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652802300
date2=1652865300
value1=1.244940
value2=1.244940
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H35
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652877000
date2=1652908500
value1=1.243610
value2=1.243610
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L35
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652877000
date2=1652908500
value1=1.235590
value2=1.235590
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H30
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652915700
date2=1652942700
value1=1.238380
value2=1.238380
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L30
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1652915700
date2=1652942700
value1=1.233510
value2=1.233510
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H69
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653408900
date2=1653471000
value1=1.255480
value2=1.255480
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L69
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653408900
date2=1653471000
value1=1.248770
value2=1.248770
</object>

<object>
type=2
name=LINEA FORCE TREND 2022H99995
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653491700
date2=1653498900
value1=1.253250
value2=1.253250
</object>

<object>
type=2
name=LINEA FORCE TREND 2022L99995
hidden=1
color=42495
width=2
selectable=0
ray1=0
ray2=0
date1=1653491700
date2=1653498900
value1=1.248610
value2=1.248610
</object>

<object>
type=20
name=SSSR#R0 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1649844000
date2=1653498900
value1=1.298535
value2=1.296772
</object>

<object>
type=20
name=SSSR#R1 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1649929500
date2=1653498900
value1=1.314990
value2=1.313890
</object>

<object>
type=20
name=SSSR#R2 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1650413700
date2=1653498900
value1=1.300624
value2=1.298642
</object>

<object>
type=20
name=SSSR#R3 Strength=Untested
hidden=1
color=13850042
background=1
selectable=0
filling=1
date1=1650546900
date2=1653498900
value1=1.309340
value2=1.308530
</object>

<object>
type=20
name=SSSR#R4 Strength=Weak
hidden=1
color=14053594
background=1
selectable=0
filling=1
date1=1650558600
date2=1653498900
value1=1.308110
value2=1.307130
</object>

<object>
type=20
name=SSSR#R5 Strength=Verified, Test Count=2
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1650564000
date2=1653498900
value1=1.303640
value2=1.301667
</object>

<object>
type=20
name=SSSR#R6 Strength=Weak
hidden=1
color=14053594
background=1
selectable=0
filling=1
date1=1650636900
date2=1653498900
value1=1.292120
value2=1.291100
</object>

<object>
type=20
name=SSSR#R7 Strength=Weak
hidden=1
color=14053594
background=1
selectable=0
filling=1
date1=1650846600
date2=1653498900
value1=1.284250
value2=1.283710
</object>

<object>
type=20
name=SSSR#R8 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1650861900
date2=1653498900
value1=1.279730
value2=1.278852
</object>

<object>
type=20
name=SSSR#R9 Strength=Weak
hidden=1
color=14053594
background=1
selectable=0
filling=1
date1=1650869100
date2=1653498900
value1=1.281300
value2=1.280640
</object>

<object>
type=20
name=SSSR#R10 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1650913200
date2=1653498900
value1=1.270845
value2=1.269172
</object>

<object>
type=20
name=SSSR#R11 Strength=Untested
hidden=1
color=13850042
background=1
selectable=0
filling=1
date1=1650954600
date2=1653498900
value1=1.277540
value2=1.276630
</object>

<object>
type=20
name=SSSR#R12 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1651705200
date2=1653498900
value1=1.265380
value2=1.262220
</object>

<object>
type=20
name=SSSR#S13 Strength=Untested
hidden=1
color=15130800
background=1
selectable=0
filling=1
date1=1652458500
date2=1653498900
value1=1.216460
value2=1.214940
</object>

<object>
type=20
name=SSSR#S14 Strength=Verified, Test Count=1
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1652476500
date2=1653498900
value1=1.222369
value2=1.221031
</object>

<object>
type=20
name=SSSR#S15 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1652673600
date2=1653498900
value1=1.230100
value2=1.228810
</object>

<object>
type=20
name=SSSR#S16 Strength=Untested
hidden=1
color=15130800
background=1
selectable=0
filling=1
date1=1652725800
date2=1653498900
value1=1.225079
value2=1.222906
</object>

<object>
type=20
name=SSSR#S17 Strength=Weak
hidden=1
color=13959039
background=1
selectable=0
filling=1
date1=1652760900
date2=1653498900
value1=1.232319
value2=1.231761
</object>

<object>
type=20
name=SSSR#S18 Strength=Verified, Test Count=1
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1652886900
date2=1653498900
value1=1.244242
value2=1.242770
</object>

<object>
type=20
name=SSSR#S19 Strength=Verified, Test Count=1
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1652915700
date2=1653498900
value1=1.234328
value2=1.232637
</object>

<object>
type=20
name=SSSR#S20 Strength=Verified, Test Count=1
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1653070500
date2=1653498900
value1=1.246433
value2=1.244689
</object>

<object>
type=20
name=SSSR#S21 Strength=Proven, Test Count=4
hidden=1
color=13688896
background=1
selectable=0
filling=1
date1=1653264000
date2=1653498900
value1=1.248710
value2=1.246550
</object>

<object>
type=20
name=SSSR#R22 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1653314400
date2=1653498900
value1=1.260550
value2=1.259300
</object>

<object>
type=20
name=SSSR#R23 Strength=Verified, Test Count=2
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1653419700
date2=1653498900
value1=1.256450
value2=1.254300
</object>

<object>
type=101
name=SSSR#0LBL
hidden=1
descr=Roto Resistencia                    
color=16777215
selectable=0
angle=0
date1=1653505452
value1=1.297653
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#1LBL
hidden=1
descr=Verificado Resistencia, Retesteado=1
color=16777215
selectable=0
angle=0
date1=1653505592
value1=1.314440
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#2LBL
hidden=1
descr=Roto Resistencia                    
color=16777215
selectable=0
angle=0
date1=1653505452
value1=1.299633
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#3LBL
hidden=1
descr=No Probado Resistencia              
color=16777215
selectable=0
angle=0
date1=1653505494
value1=1.308935
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#4LBL
hidden=1
descr=Debil Resistencia                   
color=16777215
selectable=0
angle=0
date1=1653505459
value1=1.307620
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#5LBL
hidden=1
descr=Verificado Resistencia, Retesteado=2
color=16777215
selectable=0
angle=0
date1=1653505592
value1=1.302653
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#6LBL
hidden=1
descr=Debil Resistencia                   
color=16777215
selectable=0
angle=0
date1=1653505459
value1=1.291610
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#7LBL
hidden=1
descr=Debil Resistencia                   
color=16777215
selectable=0
angle=0
date1=1653505459
value1=1.283980
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#8LBL
hidden=1
descr=Roto Resistencia                    
color=16777215
selectable=0
angle=0
date1=1653505452
value1=1.279291
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#9LBL
hidden=1
descr=Debil Resistencia                   
color=16777215
selectable=0
angle=0
date1=1653505459
value1=1.280970
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#10LBL
hidden=1
descr=Roto Resistencia                    
color=16777215
selectable=0
angle=0
date1=1653505452
value1=1.270009
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#11LBL
hidden=1
descr=No Probado Resistencia              
color=16777215
selectable=0
angle=0
date1=1653505494
value1=1.277085
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#12LBL
hidden=1
descr=Verificado Resistencia, Retesteado=1
color=16777215
selectable=0
angle=0
date1=1653505592
value1=1.263800
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#13LBL
hidden=1
descr=No Probado Soporte                  
color=16777215
selectable=0
angle=0
date1=1653505466
value1=1.215700
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#14LBL
hidden=1
descr=Verificado Soporte, Retesteado=1    
color=16777215
selectable=0
angle=0
date1=1653505564
value1=1.221700
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#15LBL
hidden=1
descr=Roto Soporte                        
color=16777215
selectable=0
angle=0
date1=1653505424
value1=1.229455
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#16LBL
hidden=1
descr=No Probado Soporte                  
color=16777215
selectable=0
angle=0
date1=1653505466
value1=1.223992
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#17LBL
hidden=1
descr=Debil Soporte                       
color=16777215
selectable=0
angle=0
date1=1653505431
value1=1.232040
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#18LBL
hidden=1
descr=Verificado Soporte, Retesteado=1    
color=16777215
selectable=0
angle=0
date1=1653505564
value1=1.243506
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#19LBL
hidden=1
descr=Verificado Soporte, Retesteado=1    
color=16777215
selectable=0
angle=0
date1=1653505564
value1=1.233483
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#20LBL
hidden=1
descr=Verificado Soporte, Retesteado=1    
color=16777215
selectable=0
angle=0
date1=1653505564
value1=1.245561
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#21LBL
hidden=1
descr=Probado Soporte, Retesteado=4       
color=16777215
selectable=0
angle=0
date1=1653505543
value1=1.247630
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#22LBL
hidden=1
descr=Verificado Resistencia, Retesteado=1
color=16777215
selectable=0
angle=0
date1=1653505592
value1=1.259925
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#23LBL
hidden=1
descr=Verificado Resistencia, Retesteado=2
color=16777215
selectable=0
angle=0
date1=1653505592
value1=1.255375
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

</window>
</chart>