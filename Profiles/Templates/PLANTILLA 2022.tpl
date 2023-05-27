<chart>
id=133138041380559666
symbol=EURAUD
description=Euro vs Australian Dollar
period_type=1
period_size=4
digits=5
tick_size=0.000000
position_time=0
scale_fix=0
scale_fixed_min=1.441100
scale_fixed_max=1.572100
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
shift_size=19.365079
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
chartline_color=65535
volumes_color=3329330
grid_color=10061943
bidline_color=10061943
askline_color=255
lastline_color=49152
stops_color=255
windows_total=1

<expert>
name=CONTROL LOTAJE PERDIDAS GANANCIAS
path=Experts\CONTROL LOTAJE PERDIDAS GANANCIAS\CONTROL LOTAJE PERDIDAS GANANCIAS.ex5
expertmode=0
<inputs>
Capital_Base=6000.0
Porcentaje_Perdida=0.5
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
Maxima_Ganancia=100.0
Maxima_Perdida=100.0
</inputs>
</expert>

<window>
height=166.731363
objects=29

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
path=Indicators\INDICADOR PATRONES PRO\Ind SupRes.ex5
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
color=-1
</graph>

<graph>
name=UP Rebote
draw=3
style=0
width=2
arrow=233
color=-1
</graph>

<graph>
name=DN Confirmacion
draw=3
style=0
width=2
arrow=234
color=65535
</graph>

<graph>
name=UP Confirmacion
draw=3
style=0
width=2
arrow=233
color=65535
</graph>

<graph>
name=BUY PATRON CONFIRMACION TEND
draw=3
style=0
width=4
arrow=233
color=16776960
</graph>

<graph>
name=SELL PATRON CONFIRMACION TEND
draw=3
style=0
width=4
arrow=234
color=16776960
</graph>

<graph>
name=Force Signal
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
Tolerancia_Puntos_Flecha=30
Espera=8
EsperarConfirmacion=3
Settings_Horario=-----------------------Settings HORARIO-----------------------
Hora_Inicio=14
Hora_Final=11
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
AlertPC=false
AlertMovil=false
AlertMail=false
S1__=-----------------------   Configuracion SOP RES---------------------
Ver_Sop_Res=true
BackLimit=500
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
S12_============================================= CONFIGURACION TREND COLOR ============================================
inpFastLength=3
inpSlowLength=7
Tolerancia_Personalized=0
</inputs>
</indicator>
<object>
type=20
name=SSSR#S0 Strength=Untested
hidden=1
color=5737262
background=1
selectable=0
filling=1
date1=1661457600
date2=1669334400
value1=1.429926
value2=1.427014
</object>

<object>
type=20
name=SSSR#S1 Strength=Weak
hidden=1
color=5197615
background=1
selectable=0
filling=1
date1=1661860800
date2=1669334400
value1=1.446138
value2=1.439691
</object>

<object>
type=20
name=SSSR#S2 Strength=Untested
hidden=1
color=5737262
background=1
selectable=0
filling=1
date1=1662364800
date2=1669334400
value1=1.461125
value2=1.454442
</object>

<object>
type=20
name=SSSR#S3 Strength=Untested
hidden=1
color=5737262
background=1
selectable=0
filling=1
date1=1662739200
date2=1669334400
value1=1.468736
value2=1.464444
</object>

<object>
type=20
name=SSSR#S4 Strength=Verified, Test Count=1
hidden=1
color=32768
background=1
selectable=0
filling=1
date1=1663214400
date2=1669334400
value1=1.475581
value2=1.469274
</object>

<object>
type=20
name=SSSR#S5 Strength=Weak
hidden=1
color=5197615
background=1
selectable=0
filling=1
date1=1665028800
date2=1669334400
value1=1.519385
value2=1.514195
</object>

<object>
type=20
name=SSSR#R6 Strength=Verified, Test Count=3
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1665964800
date2=1669334400
value1=1.574390
value2=1.560490
</object>

<object>
type=20
name=SSSR#S7 Strength=Verified, Test Count=1
hidden=1
color=32768
background=1
selectable=0
filling=1
date1=1667563200
date2=1669334400
value1=1.531150
value2=1.522753
</object>

<object>
type=20
name=SSSR#R8 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1668686400
date2=1669334400
value1=1.557550
value2=1.551730
</object>

<object>
type=101
name=SSSR#0LBL
hidden=1
descr=No Probado Soporte                  
color=5737262
selectable=0
angle=0
date1=1669910400
value1=1.428470
fontsz=10
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#1LBL
hidden=1
descr=Debil Soporte                       
color=5197615
selectable=0
angle=0
date1=1669910400
value1=1.442914
fontsz=10
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#2LBL
hidden=1
descr=No Probado Soporte                  
color=5737262
selectable=0
angle=0
date1=1669910400
value1=1.457784
fontsz=10
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#3LBL
hidden=1
descr=No Probado Soporte                  
color=5737262
selectable=0
angle=0
date1=1669910400
value1=1.466590
fontsz=10
fontnm=Courier New
anchorpos=0
</object>

<object>
type=100
name=SSSR#4LBL
hidden=1
color=32768
width=6
selectable=0
code_arrow=140
date1=1669910400
value1=1.472427
</object>

<object>
type=101
name=SSSR#5LBL
hidden=1
descr=Debil Soporte                       
color=5197615
selectable=0
angle=0
date1=1669910400
value1=1.516790
fontsz=10
fontnm=Courier New
anchorpos=0
</object>

<object>
type=100
name=SSSR#6LBL
hidden=1
color=3937500
width=6
selectable=0
code_arrow=142
date1=1669910400
value1=1.567440
</object>

<object>
type=100
name=SSSR#7LBL
hidden=1
color=32768
width=6
selectable=0
code_arrow=140
date1=1669910400
value1=1.526951
</object>

<object>
type=100
name=SSSR#8LBL
hidden=1
color=3937500
width=6
selectable=0
code_arrow=140
date1=1669910400
value1=1.554640
</object>

</window>
</chart>