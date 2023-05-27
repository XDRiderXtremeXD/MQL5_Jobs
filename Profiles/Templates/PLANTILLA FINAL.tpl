<chart>
id=132714415733746010
symbol=USDJPY
description=US Dollar vs Japanese Yen
period_type=1
period_size=1
digits=3
tick_size=0.000000
position_time=1625536800
scale_fix=0
scale_fixed_min=109.520000
scale_fixed_max=110.960000
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
shift_size=19.078105
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
window_right=852
window_bottom=896
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
objects=1050

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
path=Indicators\Mi Indicador Angelo.ex5
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
arrow=108
color=255
</graph>

<graph>
name=BUY
draw=3
style=0
width=2
arrow=108
color=32768
</graph>

<graph>
name=SELLCONFIRMACION
draw=3
style=0
width=2
arrow=234
color=16711935
</graph>

<graph>
name=BUYCONFIRMACION
draw=3
style=0
width=2
arrow=233
color=16776960
</graph>
<inputs>
STO_Price=2
Velas_Confirmacion=6
Hora_Inicio=8
Hora_Final=22
Nivel_Maximo=100.1
Nivel_Minimo=99.90000000000001
S0=-----------------------   Configuracion Estocastico ---------------------
K_Periodo=5
D_Periodo=3
Slowing=3
Ma_Method_EST=0
S1=-----------------------   Configuracion Momentun ---------------------
Momentun_Periodo=7
Momentun_Applied_Price=1
Settings_Alerts=***Settings_Alerts***
AlertPC=true
AlertMovil=true
AlertMail=false
</inputs>
</indicator>
<object>
type=32
name=autotrade #33283151 sell 0.06 USDCHF at 0.92071
hidden=1
color=1918177
selectable=0
date1=1626868581
value1=0.920710
</object>

<object>
type=31
name=autotrade #33321657 buy 0.06 USDCHF at 0.91842
hidden=1
color=11296515
selectable=0
date1=1626894609
value1=0.918420
</object>

<object>
type=2
name=autotrade #33283151 -> #33321657 USDCHF
hidden=1
descr=0.92071 -> 0.91842
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1626868581
date2=1626894609
value1=0.920710
value2=0.918420
</object>

<object>
type=32
name=autotrade #33370872 sell 0.06 USDJPY at 110.029
hidden=1
color=1918177
selectable=0
date1=1626969255
value1=110.029000
</object>

<object>
type=1
name=H1 Horizontal Line 64544
color=13850042
width=2
value1=110.318946
</object>

<object>
type=1
name=H4 Horizontal Line 9157
color=13850042
width=2
value1=109.774000
</object>

<object>
type=1
name=H4 Horizontal Line 36769
color=13850042
width=2
value1=108.586941
</object>

<object>
type=1
name=H4 Horizontal Line 40016
color=13850042
width=2
value1=107.488997
</object>

<object>
type=1
name=H4 Horizontal Line 1155
color=13850042
width=2
value1=106.159332
</object>

<object>
type=1
name=H4 Horizontal Line 50506
color=13850042
width=2
value1=104.902108
</object>

<object>
type=1
name=H4 Horizontal Line 6096
color=13850042
width=2
value1=103.876478
</object>

<object>
type=1
name=H4 Horizontal Line 47272
color=13850042
width=2
value1=103.253586
</object>

<object>
type=1
name=H4 Horizontal Line 21225
color=13850042
width=2
value1=102.611967
</object>

<object>
type=1
name=H4 Horizontal Line 18517
color=13850042
width=2
value1=110.778483
</object>

<object>
type=1
name=H4 Horizontal Line 48320
color=13850042
width=2
value1=111.611000
</object>

<object>
type=31
name=autotrade #33420460 buy 0.06 USDJPY at 110.403
hidden=1
descr=[sl 110.402]
color=11296515
selectable=0
date1=1627036407
value1=110.403000
</object>

<object>
type=2
name=autotrade #33370872 -> #33420460 USDJPY
hidden=1
descr=110.029 -> 110.403
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1626969255
date2=1627036407
value1=110.029000
value2=110.403000
</object>

<object>
type=1
name=H1 Horizontal Line 6042
color=13850042
width=2
value1=109.384441
</object>

<object>
name=H1 Vertical Line 32590
ray=1
date1=1626656400
</object>

<object>
type=101
name=VelasOPV21627682400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1627671600
value1=109.907000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1627664400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1627657200
value1=109.873000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627617600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627610400
value1=109.321000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21627520400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1627509600
value1=109.812000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1627495200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1627488000
value1=110.305000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627430400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627423200
value1=109.670000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627390800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627383600
value1=109.984000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627056000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627048800
value1=110.668000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1627056000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1627048800
value1=110.708000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627045200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627038000
value1=110.577000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626894000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626886800
value1=110.434000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626879600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626872400
value1=110.232000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626872400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626865200
value1=110.196000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1626843600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1626836400
value1=110.062000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626717600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626710400
value1=109.074000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1626717600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1626710400
value1=109.034000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21626670800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1626660000
value1=109.812000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1626670800
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1626660000
value1=109.712000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1626368400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1626361200
value1=110.165000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21626368400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1626357600
value1=110.170000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626354000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626346800
value1=109.689000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626318000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626310800
value1=109.934000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1626296400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1626289200
value1=109.908000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21626123600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1626112800
value1=110.483000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1626123600
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1626112800
value1=110.583000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1625828400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1625821200
value1=110.214000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625770800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625763600
value1=109.512000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1625770800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1625763600
value1=109.472000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625637600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625630400
value1=110.375000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21625637600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1625626800
value1=110.356000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1625637600
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1625626800
value1=110.256000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625598000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625590800
value1=110.487000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625587200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625580000
value1=110.557000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1625587200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1625580000
value1=110.517000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625500800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625493600
value1=110.804000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625450400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625443200
value1=110.940000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21625248800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1625238000
value1=111.114000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1625248800
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1625238000
value1=111.014000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625202000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625194800
value1=111.738000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625184000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625176800
value1=111.657000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21625180400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1625169600
value1=111.720000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625115600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625108400
value1=111.161000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1624968000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1624960800
value1=110.839000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21624899600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1624888800
value1=111.057000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624644000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624636800
value1=110.496000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21624557600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1624546800
value1=110.672000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624460400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624453200
value1=111.146000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1624460400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1624453200
value1=111.186000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21624460400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1624449600
value1=111.186000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624428000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624420800
value1=110.917000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1624428000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1624420800
value1=110.957000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624392000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624384800
value1=110.847000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21624392000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1624381200
value1=110.872000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624381200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624374000
value1=110.804000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21624356000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1624345200
value1=110.567000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624266000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624258800
value1=109.751000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21624266000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1624255200
value1=109.696000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1624266000
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1624255200
value1=109.596000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1624039200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1624032000
value1=110.564000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21623992400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1623981600
value1=110.408000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1623992400
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1623981600
value1=110.508000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623906000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623898800
value1=110.835000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21623906000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1623895200
value1=110.902000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1623819600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1623812400
value1=110.217000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21623805200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1623794400
value1=109.998000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21623765600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1623754800
value1=110.247000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623744000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623736800
value1=110.181000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623726000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623718800
value1=110.151000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1623711600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1623704400
value1=110.179000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21623632400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1623448800
value1=109.606000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623441600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623434400
value1=109.850000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21623441600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1623430800
value1=109.913000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21623420000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1623409200
value1=109.647000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1623420000
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1623409200
value1=109.747000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623088800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623081600
value1=109.155000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1623088800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1623081600
value1=109.115000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1623070800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1623063600
value1=109.327000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623056400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623049200
value1=109.386000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623031200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623024000
value1=109.429000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622779200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622772000
value1=110.408000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1622721600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1622714400
value1=109.925000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622638800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622631600
value1=109.955000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1622638800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1622631600
value1=109.995000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21622512800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1622502000
value1=109.672000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622487600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622480400
value1=109.313000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1622444400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1622437200
value1=109.603000
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
value1=110.279000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1622221200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1622214000
value1=110.319000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622188800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622181600
value1=110.001000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1622149200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1622142000
value1=109.963000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21622124000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1622113200
value1=109.285000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622088000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622080800
value1=109.289000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622077200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622070000
value1=109.215000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622066400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622059200
value1=109.254000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622059200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622052000
value1=109.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21621987200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1621976400
value1=108.659000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21621857600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1621846800
value1=108.656000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1621602000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1621594800
value1=108.570000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1621515600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1621508400
value1=108.876000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1621450800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1621443600
value1=108.531000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1621436400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1621429200
value1=109.416000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1621404000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1621396800
value1=109.133000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21621404000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1621393200
value1=109.155000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621342800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621335600
value1=108.818000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1621342800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1621335600
value1=108.778000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21621029600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1621018800
value1=109.522000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1620997200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1620990000
value1=109.208000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620892800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620885600
value1=109.832000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620882000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620874800
value1=109.703000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1620802800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1620795600
value1=108.987000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1620709200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1620702000
value1=109.041000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21620658800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1620648000
value1=108.641000
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
value1=108.481000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620406800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620399600
value1=108.448000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21620313200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1620302400
value1=109.023000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1620313200
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1620302400
value1=108.923000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1620212400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1620205200
value1=109.545000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1620068400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1620061200
value1=108.864000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1620054000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1620046800
value1=109.370000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620046800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620039600
value1=109.721000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620036000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620028800
value1=109.742000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1620036000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1620028800
value1=109.782000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21620036000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1620025200
value1=109.742000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620003600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619823600
value1=109.371000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619823600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619816400
value1=109.418000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1619812800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1619805600
value1=109.423000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21619791200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1619780400
value1=109.024000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1619704800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1619697600
value1=109.128000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1619672400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1619665200
value1=108.402000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619611200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619604000
value1=109.104000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1619456400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1619449200
value1=108.173000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1619197200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1619190000
value1=107.469000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1619197200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1619190000
value1=107.429000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21619143200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1619132400
value1=107.890000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1619143200
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1619132400
value1=107.790000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1618948800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1618941600
value1=108.022000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618858800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618851600
value1=107.970000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618851600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618844400
value1=108.036000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21618840800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1618830000
value1=107.970000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618826400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618819200
value1=108.422000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1618556400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1618549200
value1=108.988000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1618444800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1618437600
value1=108.841000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618387200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618380000
value1=108.837000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617987600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617980400
value1=110.034000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1617987600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1617980400
value1=110.074000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1617926400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1617919200
value1=109.397000
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
value1=109.022000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21617904800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1617894000
value1=108.985000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617886800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617879600
value1=109.411000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1617886800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1617879600
value1=109.371000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617735600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617728400
value1=109.688000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1617735600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1617728400
value1=109.648000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21617721200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1617710400
value1=110.632000
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
date1=1617685200
value1=110.487000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1617696000
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1617685200
value1=110.587000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617674400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617667200
value1=110.102000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617663600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617656400
value1=110.119000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1617285600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1617278400
value1=110.918000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21617199200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1617188400
value1=110.477000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617184800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617177600
value1=111.024000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617130800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617123600
value1=110.405000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617091200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617084000
value1=110.065000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21617022800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1617012000
value1=109.762000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21616990400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1616979600
value1=109.884000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616785200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616778000
value1=109.778000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616734800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616727600
value1=109.368000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616706000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616698800
value1=109.318000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616677200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616670000
value1=109.221000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1616677200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1616670000
value1=109.261000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21616655600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1616644800
value1=109.071000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1616486400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1616479200
value1=108.659000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21616464800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1616454000
value1=108.920000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1616176800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1616169600
value1=109.091000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1616158800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1616151600
value1=108.596000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21616050800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1616040000
value1=109.174000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1616050800
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1616040000
value1=109.274000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21615921200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1615910400
value1=108.744000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615917600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615910400
value1=108.744000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21615806000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1615795200
value1=109.445000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615554000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615546800
value1=109.210000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21615554000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1615543200
value1=109.230000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1615528800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1615521600
value1=108.861000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1615456800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1615449600
value1=108.872000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21615381200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1615370400
value1=108.620000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1615366800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1615359600
value1=109.001000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21615330800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1615320000
value1=108.375000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21615294800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1615284000
value1=108.532000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615284000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615276800
value1=109.258000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21615269600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1615258800
value1=109.314000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1615269600
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1615258800
value1=109.414000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1615172400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1615165200
value1=108.495000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614963600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614956400
value1=108.551000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614956400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614949200
value1=108.537000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614952800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1614945600
value1=108.636000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614862800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1614855600
value1=107.433000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614826800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1614819600
value1=107.152000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614783600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1614776400
value1=107.092000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21614783600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1614772800
value1=107.109000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21614639600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1614628800
value1=106.969000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614614400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1614607200
value1=106.855000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21614614400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1614603600
value1=106.854000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614603600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1614596400
value1=106.817000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21614373200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1614362400
value1=106.772000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1614373200
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1614362400
value1=106.872000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614319200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1614312000
value1=105.897000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614229200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614222000
value1=106.208000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614229200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1614222000
value1=106.248000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614204000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614196800
value1=106.055000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614196800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614189600
value1=106.014000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21614189600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1614178800
value1=106.147000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614099600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1614092400
value1=105.483000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21614099600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1614088800
value1=105.509000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614056400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614049200
value1=104.889000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614034800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614027600
value1=104.977000
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
date1=1613754000
value1=105.711000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613736000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613728800
value1=105.281000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1613595600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1613588400
value1=105.744000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21613552400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1613541600
value1=105.796000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1613552400
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1613541600
value1=105.696000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613534400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613527200
value1=106.270000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1613534400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1613527200
value1=106.310000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21613534400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1613523600
value1=106.258000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613498400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613491200
value1=105.888000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1613498400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1613491200
value1=105.928000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1613484000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1613476800
value1=105.142000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21613484000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1613473200
value1=105.195000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613462400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613455200
value1=105.674000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1613458800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1613451600
value1=105.712000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613408400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613401200
value1=105.482000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613397600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613390400
value1=105.443000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21613397600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1613386800
value1=105.498000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1613397600
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1613386800
value1=105.598000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613134800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613127600
value1=105.132000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21613134800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1613124000
value1=105.262000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1613134800
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1613124000
value1=105.362000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1612972800
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1612962000
value1=104.911000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612958400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612951200
value1=104.377000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1612958400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1612951200
value1=104.337000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612922400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612915200
value1=104.493000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612904400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612897200
value1=104.524000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21612562400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1612551600
value1=105.305000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21612544400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1612533600
value1=105.848000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1612544400
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1612533600
value1=105.948000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612494000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612486800
value1=105.720000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612450800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612443600
value1=105.417000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1612450800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1612443600
value1=105.457000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1612314000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1612306800
value1=104.903000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21612281600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1612270800
value1=105.144000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612213200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612206000
value1=105.115000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21612213200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1612202400
value1=105.080000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612202400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612195200
value1=105.077000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611925200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611918000
value1=104.982000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1611925200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1611918000
value1=105.022000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611817200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611810000
value1=104.445000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1611817200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1611810000
value1=104.485000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611792000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611784800
value1=104.275000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1611684000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1611676800
value1=103.517000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611334800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611327600
value1=103.967000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1611334800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1611327600
value1=104.007000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1611313200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1611306000
value1=103.768000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611223200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611216000
value1=103.347000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611187200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611180000
value1=103.478000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611172800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611165600
value1=103.503000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21611090000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1611079200
value1=103.815000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611050400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611043200
value1=104.166000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611036000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611028800
value1=104.163000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21610737200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1610726400
value1=103.977000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1610737200
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1610726400
value1=104.077000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21610679600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1610668800
value1=103.926000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21610658000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1610647200
value1=103.525000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1610658000
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1610647200
value1=103.425000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1610550000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1610542800
value1=104.058000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21610550000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1610539200
value1=104.077000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610521200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610514000
value1=103.538000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610499600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610492400
value1=103.709000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1610449200
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1610438400
value1=104.069000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1610388000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1610380800
value1=104.465000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610060400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610053200
value1=103.972000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1610053200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1610046000
value1=103.981000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1610046000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1610038800
value1=104.026000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21610031600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1610020800
value1=103.784000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1610031600
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1610020800
value1=103.884000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609959600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609952400
value1=103.484000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1609959600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1609952400
value1=103.524000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609887600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609880400
value1=102.586000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609765200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609758000
value1=102.674000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1609765200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1609758000
value1=102.634000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1609358400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1609351200
value1=103.429000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609351200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609344000
value1=102.968000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609315200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609308000
value1=103.223000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1609210800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1609203600
value1=103.651000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1609167600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1609160400
value1=103.782000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21608832800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1608822000
value1=103.782000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1608692400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1608685200
value1=103.463000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1608663600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1608656400
value1=103.814000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608559200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608552000
value1=103.944000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1608559200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1608552000
value1=103.984000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21608310800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1608300000
value1=103.194000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1608310800
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1608300000
value1=103.094000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608228000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608220800
value1=102.848000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1608184800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1608177600
value1=103.272000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608134400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608127200
value1=103.250000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608123600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608116400
value1=103.221000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21608123600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1608112800
value1=103.240000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608105600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608098400
value1=103.394000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1608105600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1608098400
value1=103.354000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21608080400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1608069600
value1=103.566000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608076800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608069600
value1=103.566000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21608019200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1608008400
value1=104.229000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21607986800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1607976000
value1=104.170000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1607976000
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1607965200
value1=104.171000
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
value1=103.471000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1607965200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1607958000
value1=103.431000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1607688000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1607680800
value1=104.219000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607666400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607659200
value1=103.907000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21607666400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1607655600
value1=103.897000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1607623200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1607616000
value1=104.185000
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
date1=1607594400
value1=104.636000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1607346000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1607338800
value1=104.392000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1607324400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1607317200
value1=103.914000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21607310000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1607299200
value1=104.317000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1607072400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1607065200
value1=104.056000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607054400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607047200
value1=103.731000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607029200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607022000
value1=103.837000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21607025600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1607014800
value1=103.702000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606921200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606914000
value1=104.832000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606914000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606906800
value1=104.801000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21606888800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1606878000
value1=104.539000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1606780800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1606773600
value1=104.489000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1606766400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1606759200
value1=104.465000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1606737600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1606730400
value1=104.430000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21606712400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1606701600
value1=103.792000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1606712400
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1606701600
value1=103.692000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606467600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606460400
value1=103.896000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606453200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606446000
value1=103.983000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1606453200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1606446000
value1=103.943000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1606370400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1606363200
value1=104.223000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21606356000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1606345200
value1=104.554000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1606309200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1606302000
value1=104.302000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1606208400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1606201200
value1=104.322000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606201200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606194000
value1=104.659000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1605794400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1605787200
value1=104.229000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21605729600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1605718800
value1=103.613000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605726000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605718800
value1=103.613000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605708000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605700800
value1=103.752000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605697200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605690000
value1=103.804000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1605697200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1605690000
value1=103.764000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605636000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605628800
value1=104.041000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1605636000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1605628800
value1=104.001000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21605636000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1605625200
value1=104.042000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21605542400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1605531600
value1=105.159000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605528000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605520800
value1=104.342000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605510000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605502800
value1=104.445000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605301200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605294000
value1=104.551000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1605268800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1605261600
value1=105.231000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21605268800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1605258000
value1=105.221000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605258000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605250800
value1=104.842000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605247200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605240000
value1=104.848000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1605139200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1605132000
value1=105.357000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1605096000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1605088800
value1=105.610000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605016800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605009600
value1=105.567000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1605016800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1605009600
value1=105.607000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21604988000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1604977200
value1=104.798000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604973600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604966400
value1=105.420000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1604952000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1604944800
value1=105.688000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21604916000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1604905200
value1=103.644000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21604703600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1604692800
value1=103.180000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21604674800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1604664000
value1=103.136000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1604674800
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1604664000
value1=103.036000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604671200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604664000
value1=103.136000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21604649600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1604638800
value1=103.337000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604646000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604638800
value1=103.337000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604624400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604617200
value1=103.401000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21604559600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1604548800
value1=104.193000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1604505600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1604498400
value1=104.229000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604469600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604462400
value1=105.373000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21604336400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1604325600
value1=104.590000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1604336400
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1604325600
value1=104.490000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1604318400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1604311200
value1=105.002000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1604052000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1604044800
value1=104.125000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21603983600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1603972800
value1=103.985000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603886400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603879200
value1=104.150000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21603857600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1603846800
value1=104.637000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603836000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603828800
value1=104.382000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1603800000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1603792800
value1=104.916000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21603800000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1603789200
value1=104.912000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21603785600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1603774800
value1=104.640000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1603396800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1603389600
value1=104.964000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21603378800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1603368000
value1=104.859000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1603378800
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1603368000
value1=104.959000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21603353600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1603342800
value1=104.829000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603332000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603324800
value1=104.496000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1603306800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1603299600
value1=104.377000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603213200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603206000
value1=105.792000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21603213200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1603202400
value1=105.828000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21603173600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1603162800
value1=105.670000
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
date1=1602698400
value1=105.030000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21602705600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1602694800
value1=104.996000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1602705600
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1602694800
value1=104.896000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1602612000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1602604800
value1=105.694000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602529200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602522000
value1=105.202000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1602529200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1602522000
value1=105.162000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602500400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602493200
value1=105.411000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602460800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602280800
value1=105.548000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1602270000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1602262800
value1=105.572000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602086400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602079200
value1=106.116000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21602082800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1602072000
value1=106.183000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1602082800
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1602072000
value1=106.283000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1601931600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1601924400
value1=105.850000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601636400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601629200
value1=104.995000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21601625600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1601614800
value1=105.727000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1601575200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1601568000
value1=105.789000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1601557200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1601550000
value1=105.703000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21601481600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1601470800
value1=105.815000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21601460000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1601449200
value1=105.429000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1601460000
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1601449200
value1=105.329000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1601442000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1601434800
value1=105.883000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1601377200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1601370000
value1=105.787000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21601341200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1601330400
value1=105.421000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1601319600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1601312400
value1=105.745000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21601287200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1601276400
value1=105.224000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1601060400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1601053200
value1=105.742000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1601031600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1601024400
value1=105.207000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1600945200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1600938000
value1=105.165000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600894800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600887600
value1=105.513000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1600894800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1600887600
value1=105.553000
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
value1=105.276000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1600840800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1600833600
value1=105.316000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21600808400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1600797600
value1=105.142000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600804800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600797600
value1=105.142000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21600729200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1600718400
value1=104.920000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600700400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600693200
value1=103.965000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600693200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600686000
value1=104.032000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21600678800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1600668000
value1=104.239000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1600646400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1600466400
value1=104.689000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600455600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600448400
value1=104.271000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600441200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600434000
value1=104.275000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1600441200
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1600430400
value1=104.233000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1600412400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1600405200
value1=104.941000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1600376400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1600369200
value1=104.924000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600362000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600354800
value1=104.490000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21600362000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1600351200
value1=104.495000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1600362000
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1600351200
value1=104.395000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600282800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600275600
value1=104.779000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21600282800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1600272000
value1=104.774000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600268400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600261200
value1=104.955000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600243200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600236000
value1=105.212000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600236000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600228800
value1=105.218000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600192800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600185600
value1=105.302000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1600192800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1600185600
value1=105.262000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21600192800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1600182000
value1=105.261000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1600174800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1600167600
value1=105.894000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600117200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600110000
value1=105.592000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1599847200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1599840000
value1=106.067000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21599847200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1599836400
value1=106.046000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599598800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599591600
value1=105.875000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599591600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599584400
value1=105.869000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1599573600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1599566400
value1=106.463000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1599454800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1599447600
value1=106.446000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21599454800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1599444000
value1=106.467000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21599260400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1599249600
value1=106.137000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21599242400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1599231600
value1=106.571000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21599174000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1599163200
value1=105.963000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599148800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599141600
value1=106.632000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21599148800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1599138000
value1=106.577000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1599148800
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1599138000
value1=106.677000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1599062400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1599055200
value1=106.356000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1598943600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1598936400
value1=105.573000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21598900400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1598889600
value1=106.164000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598644800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598637600
value1=105.231000
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
value1=105.163000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21598630400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1598619600
value1=105.273000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1598630400
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1598619600
value1=105.173000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598601600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598594400
value1=106.964000
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
value1=107.004000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21598601600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1598590800
value1=107.027000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598572800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598565600
value1=106.695000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598562000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598554800
value1=106.770000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598554800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598547600
value1=106.657000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598500800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598493600
value1=105.763000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1598446800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1598439600
value1=106.181000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598382000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598374800
value1=106.658000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1598382000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1598374800
value1=106.698000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21598382000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1598371200
value1=106.633000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598011200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598004000
value1=105.401000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597885200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597878000
value1=106.207000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1597885200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1597878000
value1=106.247000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21597852800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1597842000
value1=105.132000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1597852800
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1597842000
value1=105.032000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597813200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597806000
value1=105.096000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1597813200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1597806000
value1=105.056000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21597813200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1597802400
value1=105.063000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597784400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597777200
value1=105.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21597698000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1597687200
value1=105.927000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597438800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597431600
value1=106.424000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1597431600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1597424400
value1=106.396000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21597338000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1597327200
value1=107.074000
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
value1=107.095000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1597248000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1597240800
value1=107.135000
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
value1=106.906000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597222800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597215600
value1=106.865000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21597222800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1597212000
value1=106.878000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597186800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597179600
value1=106.758000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1597186800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1597179600
value1=106.798000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21597186800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1597176000
value1=106.764000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1597122000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1597114800
value1=106.256000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21597086000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1597075200
value1=105.714000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1597086000
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1597075200
value1=105.614000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21597075200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1597064400
value1=106.282000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597071600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597064400
value1=106.282000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1597060800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1597053600
value1=106.117000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596834000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596826800
value1=106.101000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1596834000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1596826800
value1=106.141000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1596718800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1596711600
value1=105.773000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1596650400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1596643200
value1=105.297000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1596585600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1596578400
value1=105.614000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1596574800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1596567600
value1=105.698000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1596560400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1596553200
value1=106.262000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1596477600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1596470400
value1=106.489000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21596477600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1596466800
value1=106.551000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596430800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596423600
value1=106.318000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596420000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596412800
value1=105.943000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21596232800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1596222000
value1=105.944000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1596232800
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1596222000
value1=106.044000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596193200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596186000
value1=104.251000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1596178800
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1596168000
value1=104.148000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21596157200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1596146400
value1=104.640000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1596157200
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1596146400
value1=104.540000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596024000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596016800
value1=104.760000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1596024000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1596016800
value1=104.720000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1595962800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1595955600
value1=104.921000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1595948400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1595941200
value1=105.046000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21595948400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1595937600
value1=105.112000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1595894400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1595887200
value1=105.528000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595876400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595869200
value1=105.080000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1595876400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1595869200
value1=105.040000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21595876400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1595865600
value1=105.076000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595865600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595858400
value1=105.252000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1595862000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1595854800
value1=105.203000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595847600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595840400
value1=105.406000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595836800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595829600
value1=105.515000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21595815200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1595631600
value1=106.183000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595628000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595620800
value1=105.791000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1595624400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1595617200
value1=105.642000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595592000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595584800
value1=106.136000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1595592000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1595584800
value1=106.096000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21595592000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1595581200
value1=106.133000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595545200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595538000
value1=106.670000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1595545200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1595538000
value1=106.630000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21595458800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1595448000
value1=107.369000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595383200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595376000
value1=106.738000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21595368800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1595358000
value1=106.644000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21595250000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1595239200
value1=107.099000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21595203200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1595019600
value1=106.901000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21594990800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1594980000
value1=107.057000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1594976400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1594969200
value1=107.126000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594940400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594933200
value1=107.482000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1594940400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1594933200
value1=107.522000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21594911600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1594900800
value1=107.271000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594836000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594828800
value1=106.626000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1594836000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1594828800
value1=106.586000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21594742400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1594731600
value1=107.496000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594666800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594659600
value1=107.398000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21594666800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1594656000
value1=107.371000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594404000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594396800
value1=106.599000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594393200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594386000
value1=106.740000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1594360800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1594353600
value1=106.967000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1594317600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1594310400
value1=107.059000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21594252800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1594242000
value1=107.162000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594249200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594242000
value1=107.162000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21594188000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1594177200
value1=107.788000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1594130400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1594123200
value1=107.822000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594076400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594069200
value1=107.245000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1594076400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1594069200
value1=107.205000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21594018800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1594008000
value1=107.854000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594015200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594008000
value1=107.854000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1593597600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1593590400
value1=107.556000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1593579600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1593572400
value1=108.172000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21593579600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1593568800
value1=108.244000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21593561600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1593550800
value1=108.060000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1593500400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1593493200
value1=107.866000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1593471600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1593464400
value1=107.805000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1593198000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1593190800
value1=107.438000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21593165600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1593154800
value1=107.005000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1593100800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1593093600
value1=107.533000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1593100800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1593093600
value1=107.573000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1593072000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1593064800
value1=107.337000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1593072000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1593064800
value1=107.377000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21593072000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1593061200
value1=107.333000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1593046800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1593039600
value1=107.141000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1593025200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1593018000
value1=107.064000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1592938800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1592931600
value1=106.175000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21592938800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1592928000
value1=106.033000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1592917200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1592910000
value1=106.976000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1592899200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1592892000
value1=107.302000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21592488800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1592478000
value1=107.134000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1592460000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1592452800
value1=106.680000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21592460000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1592449200
value1=106.662000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1592460000
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1592449200
value1=106.562000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1592398800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1592391600
value1=107.518000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1592280000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1592272800
value1=107.576000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21592280000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1592269200
value1=107.580000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1592211600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1592204400
value1=106.961000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21591974000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1591963200
value1=107.634000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1591956000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1591948800
value1=107.347000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21591923600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1591912800
value1=106.999000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591880400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591873200
value1=106.764000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1591880400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1591873200
value1=106.724000
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
date1=1591855200
value1=106.857000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591732800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591725600
value1=107.581000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591711200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591704000
value1=107.803000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591668000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591660800
value1=108.324000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591390800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591383600
value1=109.838000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1591383600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1591376400
value1=109.851000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21591358400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1591347600
value1=109.507000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21591293600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1591282800
value1=108.629000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1591189200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1591182000
value1=108.882000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591160400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591153200
value1=108.779000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1591135200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1591128000
value1=108.853000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21591005600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1590994800
value1=107.481000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1591005600
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1590994800
value1=107.381000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1590789600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1590782400
value1=107.972000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1590768000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1590760800
value1=107.044000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1590753600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1590746400
value1=107.119000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1590642000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1590634800
value1=107.952000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21590620400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1590609600
value1=107.615000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1590598800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1590591600
value1=108.027000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1590537600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1590530400
value1=107.417000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1590512400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1590505200
value1=107.404000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21590512400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1590501600
value1=107.362000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1590379200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1590372000
value1=107.861000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1590170400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1590163200
value1=107.708000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21590170400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1590159600
value1=107.732000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21589936400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1589925600
value1=107.642000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1589914800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1589907600
value1=108.065000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21589824800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1589814000
value1=107.578000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21589767200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1589583600
value1=107.026000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1589562000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1589554800
value1=106.855000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21589472000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1589461200
value1=107.183000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1589389200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1589382000
value1=106.704000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21589389200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1589378400
value1=106.787000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1589331600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1589324400
value1=107.058000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1589252400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1589245200
value1=107.737000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21589238000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1589227200
value1=107.849000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1589173200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1589166000
value1=107.092000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1589173200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1589166000
value1=107.132000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1588957200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1588950000
value1=106.808000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1588888800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1588881600
value1=106.180000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1588867200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1588860000
value1=106.672000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1588831200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1588824000
value1=106.344000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21588831200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1588820400
value1=106.376000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1588798800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1588791600
value1=105.947000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1588791600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1588784400
value1=105.984000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1588780800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1588773600
value1=106.022000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1588780800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1588773600
value1=105.982000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1588748400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1588741200
value1=106.254000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1588687200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1588680000
value1=106.941000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1588352400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1588345200
value1=106.565000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21588352400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1588341600
value1=106.575000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1588327200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1588320000
value1=106.974000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1588291200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1588284000
value1=107.412000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1588291200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1588284000
value1=107.452000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1588240800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1588233600
value1=106.366000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1588161600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1588154400
value1=106.318000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1588096800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1588089600
value1=106.640000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1588006800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1587999600
value1=106.953000
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
value1=107.071000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1587985200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1587978000
value1=107.031000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1587945600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1587765600
value1=107.329000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21587945600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1587762000
value1=107.340000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1587661200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1587654000
value1=107.306000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1587661200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1587654000
value1=107.266000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21587600000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1587589200
value1=107.660000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21587474000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1587463200
value1=107.292000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21587369600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1587358800
value1=107.950000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1587358800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1587351600
value1=107.971000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1587146400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1587139200
value1=107.286000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21587106800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1587096000
value1=107.614000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1587088800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1587081600
value1=108.142000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1587060000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1587052800
value1=107.125000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21587027600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1587016800
value1=108.163000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1586973600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1586966400
value1=107.918000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1586973600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1586966400
value1=107.958000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1586955600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1586948400
value1=107.544000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1586901600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1586894400
value1=106.951000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1586880000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1586872800
value1=107.198000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21586829600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1586818800
value1=107.846000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1586818800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1586811600
value1=107.471000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1586818800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1586811600
value1=107.431000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1586779200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1586772000
value1=107.838000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21586494800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1586484000
value1=108.668000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1586469600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1586462400
value1=108.270000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1586379600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1586372400
value1=108.575000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21586271600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1586260800
value1=109.226000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1586185200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1586178000
value1=109.219000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1586156400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1586149200
value1=109.034000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1586149200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1586142000
value1=109.128000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1585933200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1585926000
value1=108.758000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585926000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1585918800
value1=108.676000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21585864800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1585854000
value1=108.081000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21585810800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1585800000
value1=107.596000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1585810800
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1585800000
value1=107.696000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21585774800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1585764000
value1=106.959000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585684800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1585677600
value1=107.497000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21585569600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1585558800
value1=108.327000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1585555200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1585548000
value1=107.285000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1585526400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1585346400
value1=107.822000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1585335600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1585328400
value1=107.827000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21585314000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1585303200
value1=109.060000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1585306800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1585299600
value1=108.490000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1585267200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1585260000
value1=109.341000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21585245600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1585234800
value1=109.335000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1585245600
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1585234800
value1=109.235000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585202400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1585195200
value1=110.505000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21585119600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1585108800
value1=110.746000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584979200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1584972000
value1=110.918000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584979200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1584968400
value1=110.967000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584957600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1584950400
value1=109.626000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584946800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1584939600
value1=109.972000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584928800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1584745200
value1=110.706000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1584928800
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1584745200
value1=110.606000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584738000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1584730800
value1=111.585000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584738000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1584727200
value1=111.559000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584705600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1584698400
value1=109.440000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1584680400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1584673200
value1=111.281000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584680400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1584669600
value1=111.421000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584662400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1584655200
value1=110.840000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1584633600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1584626400
value1=110.080000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1584604800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1584597600
value1=109.637000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1584561600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1584554400
value1=108.627000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584536400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1584529200
value1=107.654000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584489600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1584478800
value1=107.935000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584478800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1584471600
value1=107.750000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584450000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1584439200
value1=107.114000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584378000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1584370800
value1=105.230000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1584320400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1584140400
value1=107.372000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584316800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1584136800
value1=108.463000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584316800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1584133200
value1=108.585000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1584118800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1584111600
value1=107.452000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584118800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1584111600
value1=107.492000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584072000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1584064800
value1=104.614000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584043200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1584036000
value1=105.798000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1584000000
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1583989200
value1=103.177000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583931600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1583924400
value1=105.394000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583920800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1583913600
value1=104.115000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583906400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1583899200
value1=104.642000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583888400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1583881200
value1=105.729000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21583888400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1583877600
value1=105.723000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21583838000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1583827200
value1=104.894000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1583834400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1583827200
value1=104.894000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1583755200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1583748000
value1=102.080000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1583748000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1583740800
value1=102.523000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1583740800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1583733600
value1=102.357000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1583726400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1583719200
value1=103.892000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21583726400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1583715600
value1=103.670000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1583517600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1583510400
value1=105.059000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1583510400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1583503200
value1=104.969000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1583485200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1583478000
value1=105.766000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1583460000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1583452800
value1=106.046000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1583442000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1583434800
value1=106.185000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583442000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1583434800
value1=106.145000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583416800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1583409600
value1=106.769000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583377200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1583370000
value1=107.797000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21583348400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1583337600
value1=107.107000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1583272800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1583265600
value1=106.890000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583226000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1583218800
value1=107.653000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21583226000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1583215200
value1=107.717000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583161200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1583154000
value1=107.512000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583146800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1583139600
value1=108.551000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583132400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1583125200
value1=108.372000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1583121600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1583114400
value1=107.497000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1583114400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1583107200
value1=107.325000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1582880400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1582873200
value1=108.752000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582855200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582848000
value1=109.438000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1582855200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1582848000
value1=109.398000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21582822800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1582812000
value1=109.727000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1582822800
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1582812000
value1=109.627000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21582794000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1582783200
value1=109.927000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1582686000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1582678800
value1=110.448000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582668000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582660800
value1=109.851000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21582668000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1582657200
value1=109.961000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1582668000
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1582657200
value1=109.861000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582657200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582650000
value1=109.995000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582635600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582628400
value1=110.310000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1582635600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1582628400
value1=110.270000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1582606800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1582599600
value1=111.037000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582581600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582574400
value1=110.480000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1582578000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1582570800
value1=110.294000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1582246800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1582239600
value1=112.173000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582225200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582218000
value1=112.178000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582207200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582200000
value1=112.256000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1582207200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1582200000
value1=112.296000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21582171200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1582160400
value1=111.073000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582164000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582156800
value1=111.381000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1582153200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1582146000
value1=111.672000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582095600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582088400
value1=110.149000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1582048800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1582041600
value1=110.014000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21582009200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1581998400
value1=109.618000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582005600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1581998400
value1=109.618000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1581508800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1581501600
value1=110.197000
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
value1=109.972000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580976000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580968800
value1=110.061000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1580976000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1580968800
value1=110.101000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580925600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580918400
value1=109.925000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580911200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580904000
value1=109.805000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21580911200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1580900400
value1=109.785000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580878800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580871600
value1=109.573000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580871600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580864400
value1=109.564000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580821200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580814000
value1=109.174000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1580821200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1580814000
value1=109.214000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1580738400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1580731200
value1=108.378000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580695200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580688000
value1=108.281000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580497200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580490000
value1=108.271000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21580421600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1580410800
value1=108.548000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1580112000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1580104800
value1=109.193000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580094000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580086800
value1=108.756000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1580094000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1580086800
value1=108.716000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1579906800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1579899600
value1=109.190000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1579867200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1579860000
value1=109.723000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1579834800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1579827600
value1=109.657000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1579820400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1579813200
value1=109.608000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1579813200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1579806000
value1=109.310000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1579784400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1579777200
value1=109.481000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1579773600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1579766400
value1=109.493000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1579600800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1579593600
value1=109.860000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21579600800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1579590000
value1=109.848000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1579582800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1579575600
value1=109.857000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1579269600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1579262400
value1=110.045000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1579233600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1579226400
value1=110.342000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21579208400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1579197600
value1=110.259000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1579204800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1579197600
value1=110.259000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1579176000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1579168800
value1=110.120000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1579114800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1579107600
value1=110.083000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1578996000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1578988800
value1=110.203000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1578985200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1578978000
value1=110.179000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1578974400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1578967200
value1=110.255000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1578931200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1578924000
value1=109.993000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1578924000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1578916800
value1=109.984000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1578675600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1578668400
value1=109.770000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1578661200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1578654000
value1=109.735000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1578596400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1578589200
value1=109.640000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1578582000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1578574800
value1=109.539000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1578546000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1578538800
value1=109.318000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1578524400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1578517200
value1=109.311000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1578524400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1578517200
value1=109.351000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21578524400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1578513600
value1=109.325000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21578499200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1578488400
value1=108.866000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1578456000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1578448800
value1=107.769000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21578355200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1578344400
value1=108.541000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1578355200
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1578344400
value1=108.641000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21578085200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1578074400
value1=107.893000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1578074400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1578067200
value1=108.301000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21578074400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1578063600
value1=108.348000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1578052800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1578045600
value1=107.880000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1578031200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1578024000
value1=107.966000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1578031200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1578024000
value1=107.926000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1577991600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1577984400
value1=108.220000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1577811600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1577804400
value1=108.430000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1577779200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1577772000
value1=108.622000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1577736000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1577728800
value1=108.799000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1577728800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1577721600
value1=108.727000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1577710800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1577703600
value1=109.072000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1577703600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1577696400
value1=109.097000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21577664000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1577480400
value1=109.349000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1577401200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1577394000
value1=109.741000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1577390400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1577383200
value1=109.746000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1577340000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1577332800
value1=109.643000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21576879200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1576868400
value1=109.606000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1576792800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1576785600
value1=109.168000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21576620000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1576609200
value1=109.403000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1576526400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1576519200
value1=109.741000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1576249200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1576242000
value1=109.754000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1576105200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1576098000
value1=108.452000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21575943200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1575932400
value1=108.509000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21575579600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1575568800
value1=108.616000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21575500400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1575489600
value1=109.043000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1575460800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1575453600
value1=108.418000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1575439200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1575432000
value1=108.462000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1575424800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1575417600
value1=108.571000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1575342000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1575334800
value1=108.912000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1575284400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1575277200
value1=109.539000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1575061200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1575054000
value1=109.356000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1575046800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1575039600
value1=109.726000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1575046800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1575039600
value1=109.766000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1574906400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1574899200
value1=109.613000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21574899200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1574888400
value1=109.682000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1574744400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1574737200
value1=109.164000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21574366400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1574355600
value1=108.463000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1574366400
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1574355600
value1=108.363000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21574312400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1574301600
value1=108.239000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1574190000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1574182800
value1=108.412000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21574172000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1574161200
value1=108.916000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21574114400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1574103600
value1=108.517000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1574103600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1574096400
value1=108.472000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1574092800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1574085600
value1=109.119000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1574085600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1574078400
value1=109.140000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1574085600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1574078400
value1=109.180000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1573768800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1573761600
value1=108.228000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1573671600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1573664400
value1=108.675000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1573671600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1573664400
value1=108.635000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21573671600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1573660800
value1=108.623000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21573502400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1573491600
value1=109.189000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1573502400
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1573491600
value1=109.289000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1573225200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1573218000
value1=109.556000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1573164000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1573156800
value1=109.537000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1573160400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1573153200
value1=109.568000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1573135200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1573128000
value1=109.263000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21573113600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1573102800
value1=108.634000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1573113600
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1573102800
value1=108.534000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1573110000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1573102800
value1=108.634000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1573005600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1572998400
value1=109.259000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1572994800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1572987600
value1=109.323000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1572973200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1572966000
value1=109.030000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1572962400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1572955200
value1=108.939000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21572940800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1572930000
value1=108.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1572912000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1572904800
value1=108.688000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1572876000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1572868800
value1=108.544000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21572649200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1572638400
value1=108.362000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1572609600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1572602400
value1=107.888000
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
value1=107.848000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1572508800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1572501600
value1=108.573000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1572501600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1572494400
value1=108.595000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21572296400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1572285600
value1=109.120000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1572292800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1572285600
value1=109.120000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1572285600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1572278400
value1=109.012000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1572285600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1572278400
value1=109.052000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21571943600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1571932800
value1=108.456000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1571943600
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1571932800
value1=108.356000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21571868000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1571857200
value1=108.779000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1571864400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1571857200
value1=108.779000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1571817600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1571810400
value1=108.238000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21571346000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1571335200
value1=108.422000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1571346000
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1571335200
value1=108.322000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1571194800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1571187600
value1=108.935000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21571083200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1571072400
value1=108.538000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1570824000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1570816800
value1=108.655000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1570820400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1570813200
value1=108.704000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1570755600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1570748400
value1=108.054000
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
value1=108.015000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21570737600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1570726800
value1=108.055000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1570654800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1570647600
value1=107.708000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1570654800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1570647600
value1=107.748000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1570593600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1570586400
value1=106.901000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1570572000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1570564800
value1=107.378000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1570550400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1570543200
value1=106.785000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1570485600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1570478400
value1=107.474000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21570212000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1570201200
value1=107.199000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21570176000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1570165200
value1=106.708000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1570129200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1570122000
value1=106.631000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21570122000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1570111200
value1=106.869000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1570078800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1570071600
value1=106.988000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21570053600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1570042800
value1=107.007000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1570053600
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1570042800
value1=106.907000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21570006800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1569996000
value1=107.962000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1569934800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1569927600
value1=108.495000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1569916800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1569909600
value1=108.377000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1569852000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1569844800
value1=108.057000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1569610800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1569603600
value1=108.261000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1569600000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1569592800
value1=108.226000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21569574800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1569564000
value1=107.617000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1569452400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1569445200
value1=107.895000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1569445200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1569438000
value1=107.912000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1569373200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1569366000
value1=106.941000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21569369600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1569358800
value1=106.921000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1569369600
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1569358800
value1=106.821000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1569243600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1569236400
value1=107.306000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1569243600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1569236400
value1=107.266000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1569200400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1569020400
value1=107.591000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21568991600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1568980800
value1=108.081000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21568973600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1568962800
value1=107.797000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1568754000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1568746800
value1=108.019000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1568696400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1568689200
value1=108.449000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1568660400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1568653200
value1=108.176000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1568620800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1568613600
value1=107.941000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21568332800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1568322000
value1=108.269000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1568278800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1568271600
value1=108.167000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1568203200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1568196000
value1=107.906000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1568196000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1568188800
value1=107.912000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1568178000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1568170800
value1=107.713000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1568095200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1568088000
value1=107.517000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21568095200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1568084400
value1=107.579000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21568059200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1568048400
value1=107.263000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1568059200
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1568048400
value1=107.363000
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
value1=107.139000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1567742400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1567735200
value1=107.167000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1567742400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1567735200
value1=107.207000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1567728000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1567720800
value1=107.103000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1567713600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1567706400
value1=107.076000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1567670400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1567663200
value1=106.733000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1567533600
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1567522800
value1=106.393000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21567494000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1567483200
value1=106.466000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21567202400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1567191600
value1=106.511000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1567202400
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1567191600
value1=106.611000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1567119600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1567112400
value1=106.727000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1567119600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1567112400
value1=106.767000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1567036800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1567029600
value1=106.285000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1566892800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1566885600
value1=105.612000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1566792000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1566784800
value1=104.808000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1566601200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1566594000
value1=105.240000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21566493200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1566482400
value1=106.719000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1566493200
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1566482400
value1=106.819000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1566471600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1566464400
value1=106.286000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1566457200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1566450000
value1=106.363000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21566435600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1566424800
value1=106.725000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21566388800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1566378000
value1=106.681000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21566244800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1566234000
value1=106.441000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21566187200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1566176400
value1=106.550000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1565881200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1565874000
value1=105.709000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21565881200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1565870400
value1=105.663000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1565798400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1565791200
value1=105.738000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1565755200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1565748000
value1=106.692000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21565748000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1565737200
value1=106.846000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1565748000
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1565737200
value1=106.946000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21565726400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1565715600
value1=106.725000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1565697600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1565690400
value1=105.152000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21565625600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1565614800
value1=105.009000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1565622000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1565614800
value1=105.009000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1565578800
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1565568000
value1=105.772000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1565380800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1565373600
value1=105.228000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1565290800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1565283600
value1=106.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1565226000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1565218800
value1=106.350000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1565208000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1565200800
value1=105.457000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1565200800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1565193600
value1=105.589000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1565200800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1565193600
value1=105.549000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21565179200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1565168400
value1=106.385000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1565179200
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1565168400
value1=106.485000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1565103600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1565096400
value1=106.261000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1565064000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1565056800
value1=105.528000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1565038800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1565031600
value1=105.860000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1565024400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1565017200
value1=105.971000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1565017200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1565010000
value1=106.258000
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