<chart>
id=132850960594500082
symbol=NAS100
description=US Tech 100 Index
period_type=1
period_size=1
digits=1
tick_size=0.000000
position_time=0
scale_fix=0
scale_fixed_min=15495.023179
scale_fixed_max=16554.053642
scale_fix11=0
scale_bar=0
scale_bar_val=1.000000
scale=8
mode=1
fore=0
grid=0
volume=0
scroll=1
shift=1
shift_size=19.308357
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
objects=28

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
path=Indicators\Patrones rebote Tendencia.ex5
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
path=Indicators\Supply And Demand V2.0.ex5
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
color=255
</graph>
<inputs>
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
name=SSSR#S0 Strength=Verified, Test Count=1
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1624564800
date2=1640628000
value1=14419.435714
value2=14310.067857
</object>

<object>
type=20
name=SSSR#S1 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1633633200
date2=1640628000
value1=15028.444643
value2=14977.800000
</object>

<object>
type=20
name=SSSR#S2 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1633971600
date2=1640628000
value1=14931.621429
value2=14876.100000
</object>

<object>
type=20
name=SSSR#S3 Strength=Verified, Test Count=1
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1634032800
date2=1640628000
value1=14629.753571
value2=14572.523214
</object>

<object>
type=20
name=SSSR#S4 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1634050800
date2=1640628000
value1=14814.039286
value2=14757.821429
</object>

<object>
type=20
name=SSSR#S5 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1634518800
date2=1640628000
value1=15188.625000
value2=15147.450000
</object>

<object>
type=20
name=SSSR#S6 Strength=Untested
hidden=1
color=15130800
background=1
selectable=0
filling=1
date1=1634551200
date2=1640628000
value1=15067.960714
value2=15042.969643
</object>

<object>
type=20
name=SSSR#S7 Strength=Proven, Test Count=7
hidden=1
color=13688896
background=1
selectable=0
filling=1
date1=1634922000
date2=1640628000
value1=15661.689286
value2=15448.639286
</object>

<object>
type=20
name=SSSR#S8 Strength=Verified, Test Count=1
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1634925600
date2=1640628000
value1=15362.321429
value2=15268.501786
</object>

<object>
type=20
name=SSSR#R9 Strength=Untested
hidden=1
color=13850042
background=1
selectable=0
filling=1
date1=1637600400
date2=1640628000
value1=16783.587500
value2=16738.025000
</object>

<object>
type=20
name=SSSR#R10 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1638234000
date2=1640628000
value1=16492.908929
value2=16386.082143
</object>

<object>
type=20
name=SSSR#S11 Strength=Turncoat
hidden=1
color=36095
background=1
selectable=0
filling=1
date1=1639764000
date2=1640628000
value1=16032.230357
value2=15861.992857
</object>

<object>
type=20
name=SSSR#S12 Strength=Weak
hidden=1
color=13959039
background=1
selectable=0
filling=1
date1=1640253600
date2=1640628000
value1=16165.639286
value2=16146.080357
</object>

<object>
type=20
name=SSSR#S13 Strength=Weak
hidden=1
color=13959039
background=1
selectable=0
filling=1
date1=1640595600
date2=1640628000
value1=16320.900000
value2=16303.262500
</object>

<object>
type=101
name=SSSR#0LBL
hidden=1
descr=Verificado Soporte, Retesteado=1    
color=16777215
selectable=0
angle=0
date1=1640667520
value1=14364.751786
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#1LBL
hidden=1
descr=Roto Soporte                        
color=16777215
selectable=0
angle=0
date1=1640667520
value1=15003.122321
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#2LBL
hidden=1
descr=Roto Soporte                        
color=16777215
selectable=0
angle=0
date1=1640667520
value1=14903.860714
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#3LBL
hidden=1
descr=Verificado Soporte, Retesteado=1    
color=16777215
selectable=0
angle=0
date1=1640667520
value1=14601.138393
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#4LBL
hidden=1
descr=Roto Soporte                        
color=16777215
selectable=0
angle=0
date1=1640667520
value1=14785.930357
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#5LBL
hidden=1
descr=Roto Soporte                        
color=16777215
selectable=0
angle=0
date1=1640667520
value1=15168.037500
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#6LBL
hidden=1
descr=No Probado Soporte                  
color=16777215
selectable=0
angle=0
date1=1640667520
value1=15055.465179
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#7LBL
hidden=1
descr=Probado Soporte, Retesteado=7       
color=16777215
selectable=0
angle=0
date1=1640667520
value1=15555.164286
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#8LBL
hidden=1
descr=Verificado Soporte, Retesteado=1    
color=16777215
selectable=0
angle=0
date1=1640667520
value1=15315.411607
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#9LBL
hidden=1
descr=No Probado Resistencia              
color=16777215
selectable=0
angle=0
date1=1640667520
value1=16760.806250
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
date1=1640667520
value1=16439.495536
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#11LBL
hidden=1
descr=Roto Soporte                        
color=16777215
selectable=0
angle=0
date1=1640667520
value1=15947.111607
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#12LBL
hidden=1
descr=Debil Soporte                       
color=16777215
selectable=0
angle=0
date1=1640667520
value1=16155.859821
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

<object>
type=101
name=SSSR#13LBL
hidden=1
descr=Debil Soporte                       
color=16777215
selectable=0
angle=0
date1=1640667520
value1=16312.081250
fontsz=8
fontnm=Courier New
anchorpos=0
</object>

</window>
</chart>