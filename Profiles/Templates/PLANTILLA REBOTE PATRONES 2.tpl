<chart>
id=132847557836425266
symbol=USDCHF
description=US Dollar vs Swiss Franc
period_type=1
period_size=8
digits=5
tick_size=0.000000
position_time=0
scale_fix=0
scale_fixed_min=0.909900
scale_fixed_max=0.937900
scale_fix11=0
scale_bar=0
scale_bar_val=1.000000
scale=16
mode=1
fore=0
grid=0
volume=0
scroll=1
shift=1
shift_size=19.500480
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

<window>
height=166.731363
objects=32

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
width=1
arrow=251
color=13688896
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
width=4
arrow=251
color=16777215
</graph>
period=150
method=0
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\Supply And Demand V3.0.ex5
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
<inputs>
TransparienciaDePatronesSinRSIoEST=true
Hora_Inicio=0
Hora_Final=0
Tipo_de_Datos=1
Filtro_Traspaso_50=false
Tolerancia_Puntos_Flecha=10
S0=-----------------------   Configuracion Estocastico ---------------------
K_Periodo=5
D_Periodo=3
Slowing=3
Ma_Method_EST=0
S11=-----------------------   Configuracion MA---------------------
Filter_MA=true
Tolerancia_Puntos=0
Period_MA_SLOW=150
Period_MA=50
Shift_MA=0
APP_MA=1
MODE_MA=0
S1=-----------------------   Configuracion Momentun ---------------------
Momentun_Periodo=7
Momentun_Applied_Price=1
S1_=-----------------------   Configuracion RSI---------------------
Condicion_Signal_Contrarias=true
RSI_Period=14
APP_RSI=1
Settings_Alerts=***Settings_Alerts***
AlertPC=false
AlertMovil=false
AlertMail=false
BackLimit=3000
pus1=/////////////////////////////////////////////////
zone_show_weak=true
zone_show_untested=true
zone_show_turncoat=true
zone_fuzzfactor=0.75
color_support_weak=13959039
color_support_untested=15130800
color_support_verified=15453831
color_support_proven=13688896
color_support_turncoat=36095
color_resist_weak=14053594
color_resist_untested=13850042
color_resist_verified=3937500
color_resist_proven=255
color_resist_turncoat=36095
SeparacionTexto=10
</inputs>
</indicator>
<object>
type=20
name=SSSR#R0 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1542096000
date2=1640275200
value1=1.014792
value2=1.007824
</object>

<object>
type=20
name=SSSR#R1 Strength=Verified, Test Count=2
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1556035200
date2=1640275200
value1=1.024775
value2=1.020098
</object>

<object>
type=20
name=SSSR#R2 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1570089600
date2=1640275200
value1=1.004629
value2=1.000280
</object>

<object>
type=20
name=SSSR#R3 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1575648000
date2=1640275200
value1=0.994413
value2=0.982350
</object>

<object>
type=20
name=SSSR#R4 Strength=Proven, Test Count=7
hidden=1
background=1
selectable=0
filling=1
date1=1585526400
date2=1640275200
value1=0.957310
value2=0.944717
</object>

<object>
type=20
name=SSSR#R5 Strength=Proven, Test Count=5
hidden=1
background=1
selectable=0
filling=1
date1=1586188800
date2=1640275200
value1=0.982054
value2=0.973316
</object>

<object>
type=20
name=SSSR#R6 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1589990400
date2=1640275200
value1=0.966624
value2=0.962240
</object>

<object>
type=20
name=SSSR#S7 Strength=Untested
hidden=1
color=15130800
background=1
selectable=0
filling=1
date1=1609920000
date2=1640275200
value1=0.878196
value2=0.874542
</object>

<object>
type=20
name=SSSR#S8 Strength=Untested
hidden=1
color=15130800
background=1
selectable=0
filling=1
date1=1611302400
date2=1640275200
value1=0.885830
value2=0.882759
</object>

<object>
type=20
name=SSSR#S9 Strength=Untested
hidden=1
color=15130800
background=1
selectable=0
filling=1
date1=1613462400
date2=1640275200
value1=0.889155
value2=0.886132
</object>

<object>
type=20
name=SSSR#S10 Strength=Verified, Test Count=2
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1621929600
date2=1640275200
value1=0.895056
value2=0.891688
</object>

<object>
type=20
name=SSSR#S11 Strength=Untested
hidden=1
color=15130800
background=1
selectable=0
filling=1
date1=1628092800
date2=1640275200
value1=0.904001
value2=0.900745
</object>

<object>
type=20
name=SSSR#R12 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1632988800
date2=1640275200
value1=0.938732
value2=0.934308
</object>

<object>
type=20
name=SSSR#S13 Strength=Verified, Test Count=1
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1635811200
date2=1640275200
value1=0.911475
value2=0.907204
</object>

<object>
type=20
name=SSSR#S14 Strength=Verified, Test Count=2
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1638288000
date2=1640275200
value1=0.920707
value2=0.913788
</object>

<object>
type=20
name=SSSR#R15 Strength=Untested
hidden=1
color=13850042
background=1
selectable=0
filling=1
date1=1639584000
date2=1640275200
value1=0.930714
value2=0.926892
</object>

<object>
type=101
name=SSSR#0LBL
hidden=1
descr=Verificado Resistencia, Retesteado=1
color=16777215
selectable=0
angle=0
date1=1640577675
value1=1.011308
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#1LBL
hidden=1
descr=Verificado Resistencia, Retesteado=2
color=16777215
selectable=0
angle=0
date1=1640577675
value1=1.022436
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#2LBL
hidden=1
descr=Verificado Resistencia, Retesteado=1
color=16777215
selectable=0
angle=0
date1=1640577675
value1=1.002454
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#3LBL
hidden=1
descr=Verificado Resistencia, Retesteado=1
color=16777215
selectable=0
angle=0
date1=1640577675
value1=0.988382
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#4LBL
hidden=1
descr=Probado Resistencia, Retesteado=7   
color=16777215
selectable=0
angle=0
date1=1640577675
value1=0.951014
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#5LBL
hidden=1
descr=Probado Resistencia, Retesteado=5   
color=16777215
selectable=0
angle=0
date1=1640577675
value1=0.977685
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#6LBL
hidden=1
descr=Verificado Resistencia, Retesteado=1
color=16777215
selectable=0
angle=0
date1=1640577675
value1=0.964432
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#7LBL
hidden=1
descr=No Probado Soporte                  
color=16777215
selectable=0
angle=0
date1=1640577675
value1=0.876369
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#8LBL
hidden=1
descr=No Probado Soporte                  
color=16777215
selectable=0
angle=0
date1=1640577675
value1=0.884295
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#9LBL
hidden=1
descr=No Probado Soporte                  
color=16777215
selectable=0
angle=0
date1=1640577675
value1=0.887644
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#10LBL
hidden=1
descr=Verificado Soporte, Retesteado=2    
color=16777215
selectable=0
angle=0
date1=1640577675
value1=0.893372
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#11LBL
hidden=1
descr=No Probado Soporte                  
color=16777215
selectable=0
angle=0
date1=1640577675
value1=0.902373
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
date1=1640577675
value1=0.936520
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#13LBL
hidden=1
descr=Verificado Soporte, Retesteado=1    
color=16777215
selectable=0
angle=0
date1=1640577675
value1=0.909339
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#14LBL
hidden=1
descr=Verificado Soporte, Retesteado=2    
color=16777215
selectable=0
angle=0
date1=1640577675
value1=0.917248
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#15LBL
hidden=1
descr=No Probado Resistencia              
color=16777215
selectable=0
angle=0
date1=1640577675
value1=0.928803
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

</window>
</chart>