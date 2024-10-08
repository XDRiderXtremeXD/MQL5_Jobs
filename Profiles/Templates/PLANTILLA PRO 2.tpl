<chart>
id=132792543835146060
symbol=USDCHF
description=US Dollar vs Swiss Franc
period_type=0
period_size=30
digits=5
tick_size=0.000000
position_time=0
scale_fix=0
scale_fixed_min=0.928700
scale_fixed_max=0.947600
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
shift_size=19.878604
fixed_pos=0.000000
ticker=1
ohlc=0
one_click=0
one_click_btn=1
bidline=1
askline=1
lastline=0
days=0
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
objects=276

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
color=16748574,3937500
</graph>

<graph>
name=PTL slow line
draw=1
style=2
width=1
color=16748574
</graph>

<graph>
name=PTL fast line
draw=1
style=2
width=1
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
inpFastLength=2
inpSlowLength=5
</inputs>
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\MULTIDIVERGENCIA Close v2 - Angelo.ex5
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
color=
</graph>
<inputs>
Tipo_de_Datos=1
Ver_Lineas_Precio=true
S1_============================================= CONFIGURACION RSI ============================================
Ver_Indicador_RSI=true
Ver_Indicador_RSI_Indicador=false
RSI_Periodo=14
RSI_Applied_Price=1
Filtro_Retroceso_RSI=6
Filtro_SobreCompra_SobreVenta_RSI=false
S6_============================================= CONFIGURACION MACD ============================================
Ver_Indicador_MACD=true
Ver_Indicador_MACD_Indicador=false
Period_MACD=12
Slow_Ema_MACD=26
Signal_Period_MACD=9
Applied_Price_MACD=1
S7=============================================  CONFIGURACION ESTOCASTICO ============================================
Ver_Indicador_ESTOCASTICO=true
Ver_Indicador_ESTOCASTICO_Indicador=false
K_Periodo=10
D_Periodo=3
Slowing=5
Ma_Method_EST=0
STO_EST=0
Filtro_Retroceso_ESTOCASTICO=2
Filtro_SobreCompra_SobreVenta_Est=false
s7============================================= Divergence ============================================
Ver_Divergencias_con_Indicador_Atrasado=true
Filtro_Traspaso_50=true
Filtro_Trix=true
Mostrar_Lineas=1
X_Velas=10000
Ver_Divergencias_en_un_mismo_Punto=1
Ver_Divergencia_Oculta=true
Ver_Divergencia_Regular=true
ColorDivergenceOculta=16711935
ColorDivergenceRegular=16776960
Estilo_Linea=0
Grosor_Linea=1
Crossing_Tolerance=20
Distancia_Maxima=1000
Distancia_Minima=5
s74============================================= Flechas ============================================
ColorFlechaAlcista=8388352
ColorFlechaBajista=42495
CodigoAlcista=221
CodigoBajista=222
AnchoFlecha=1
s71============================================= Alertas ============================================
AlertPC=true
AlertMovil=true
AlertMail=false
Conector=false
S11_============================================= CONFIGURACION TRIX ============================================
Periodo_Trix=25
Applied_Price_Trix=1
</inputs>
</indicator>
<object>
type=32
name=autotrade #16308442 sell 0.01 USDCHF at 0.90960
hidden=1
color=1918177
selectable=0
date1=1596740636
value1=0.909600
</object>

<object>
type=31
name=autotrade #16325434 buy 0.01 USDCHF at 0.91161
hidden=1
descr=[sl 0.91161]
color=11296515
selectable=0
date1=1596777993
value1=0.911610
</object>

<object>
type=32
name=autotrade #16336879 sell 0.01 USDCHF at 0.91051
hidden=1
color=1918177
selectable=0
date1=1596795314
value1=0.910510
</object>

<object>
type=31
name=autotrade #16338542 buy 0.01 USDCHF at 0.91240
hidden=1
descr=[sl 0.91240]
color=11296515
selectable=0
date1=1596797451
value1=0.912400
</object>

<object>
type=32
name=autotrade #17072202 sell 0.01 USDCHF at 0.90967
hidden=1
color=1918177
selectable=0
date1=1598268254
value1=0.909670
</object>

<object>
type=31
name=autotrade #17093087 buy 0.01 USDCHF at 0.90963
hidden=1
color=11296515
selectable=0
date1=1598289235
value1=0.909630
</object>

<object>
type=32
name=autotrade #17583562 sell 0.01 USDCHF at 0.90951
hidden=1
color=1918177
selectable=0
date1=1599152508
value1=0.909510
</object>

<object>
type=31
name=autotrade #17593611 buy 0.01 USDCHF at 0.91149
hidden=1
descr=[sl 0.91150]
color=11296515
selectable=0
date1=1599157325
value1=0.911490
</object>

<object>
type=31
name=autotrade #17714285 buy 0.02 USDCHF at 0.91829
hidden=1
color=11296515
selectable=0
date1=1599559817
value1=0.918290
</object>

<object>
type=32
name=autotrade #17747154 sell 0.02 USDCHF at 0.91829
hidden=1
descr=[sl 0.91829]
color=1918177
selectable=0
date1=1599584580
value1=0.918290
</object>

<object>
type=32
name=autotrade #18125247 sell 0.04 USDCHF at 0.90966
hidden=1
color=1918177
selectable=0
date1=1600357828
value1=0.909660
</object>

<object>
type=31
name=autotrade #18140850 buy 0.04 USDCHF at 0.90998
hidden=1
color=11296515
selectable=0
date1=1600370273
value1=0.909980
</object>

<object>
type=31
name=autotrade #18168599 buy 0.04 USDCHF at 0.90910
hidden=1
color=11296515
selectable=0
date1=1600436448
value1=0.909100
</object>

<object>
type=32
name=autotrade #18176493 sell 0.04 USDCHF at 0.90920
hidden=1
descr=[sl 0.90920]
color=1918177
selectable=0
date1=1600445088
value1=0.909200
</object>

<object>
type=32
name=autotrade #18185479 sell 0.04 USDCHF at 0.90981
hidden=1
color=1918177
selectable=0
date1=1600450814
value1=0.909810
</object>

<object>
type=31
name=autotrade #18187726 buy 0.04 USDCHF at 0.90973
hidden=1
color=11296515
selectable=0
date1=1600452029
value1=0.909730
</object>

<object>
type=32
name=autotrade #18597224 sell 0.04 USDCHF at 0.92319
hidden=1
color=1918177
selectable=0
date1=1601380485
value1=0.923190
</object>

<object>
type=31
name=autotrade #18616651 buy 0.04 USDCHF at 0.91988
hidden=1
descr=[tp 0.91988]
color=11296515
selectable=0
date1=1601398926
value1=0.919880
</object>

<object>
type=32
name=autotrade #18838375 sell 0.04 USDCHF at 0.91563
hidden=1
color=1918177
selectable=0
date1=1601901228
value1=0.915630
</object>

<object>
type=31
name=autotrade #18870297 buy 0.04 USDCHF at 0.91563
hidden=1
color=11296515
selectable=0
date1=1601938834
value1=0.915630
</object>

<object>
type=31
name=autotrade #19401600 buy 0.04 USDCHF at 0.91650
hidden=1
color=11296515
selectable=0
date1=1603101446
value1=0.916500
</object>

<object>
type=32
name=autotrade #19404863 sell 0.04 USDCHF at 0.91450
hidden=1
descr=[sl 0.91450]
color=1918177
selectable=0
date1=1603104726
value1=0.914500
</object>

<object>
type=32
name=autotrade #19498107 sell 0.08 USDCHF at 0.90680
hidden=1
color=1918177
selectable=0
date1=1603213659
value1=0.906800
</object>

<object>
type=31
name=autotrade #19504041 buy 0.08 USDCHF at 0.90680
hidden=1
descr=[sl 0.90680]
color=11296515
selectable=0
date1=1603216859
value1=0.906800
</object>

<object>
type=32
name=autotrade #19508521 sell 0.08 USDCHF at 0.90680
hidden=1
color=1918177
selectable=0
date1=1603221327
value1=0.906800
</object>

<object>
type=31
name=autotrade #19513897 buy 0.08 USDCHF at 0.90672
hidden=1
color=11296515
selectable=0
date1=1603229283
value1=0.906720
</object>

<object>
type=32
name=autotrade #19540186 sell 0.04 USDCHF at 0.90420
hidden=1
color=1918177
selectable=0
date1=1603277764
value1=0.904200
</object>

<object>
type=31
name=autotrade #19558444 buy 0.04 USDCHF at 0.90423
hidden=1
descr=[sl 0.90420]
color=11296515
selectable=0
date1=1603296172
value1=0.904230
</object>

<object>
type=31
name=autotrade #20026489 buy 0.04 USDCHF at 0.91845
hidden=1
color=11296515
selectable=0
date1=1604313248
value1=0.918450
</object>

<object>
type=32
name=autotrade #20058604 sell 0.04 USDCHF at 0.92025
hidden=1
color=1918177
selectable=0
date1=1604350641
value1=0.920250
</object>

<object>
type=31
name=autotrade #22139635 buy 0.04 USDCHF at 0.88740
hidden=1
color=11296515
selectable=0
date1=1608022057
value1=0.887400
</object>

<object>
type=32
name=autotrade #22208765 sell 0.04 USDCHF at 0.88448
hidden=1
descr=[sl 0.88440]
color=1918177
selectable=0
date1=1608114602
value1=0.884480
</object>

<object>
type=31
name=autotrade #23165271 buy 0.1 USDCHF at 0.88765
hidden=1
color=11296515
selectable=0
date1=1610100351
value1=0.887650
</object>

<object>
type=32
name=autotrade #23173553 sell 0.1 USDCHF at 0.88565
hidden=1
descr=[sl 0.88565]
color=1918177
selectable=0
date1=1610108128
value1=0.885650
</object>

<object>
type=32
name=autotrade #23185523 sell 0.1 USDCHF at 0.88264
hidden=1
color=1918177
selectable=0
date1=1610120714
value1=0.882640
</object>

<object>
type=31
name=autotrade #23193491 buy 0.1 USDCHF at 0.88461
hidden=1
descr=[sl 0.88465]
color=11296515
selectable=0
date1=1610124328
value1=0.884610
</object>

<object>
type=32
name=autotrade #23194303 sell 0.1 USDCHF at 0.88410
hidden=1
color=1918177
selectable=0
date1=1610124544
value1=0.884100
</object>

<object>
type=31
name=autotrade #23198984 buy 0.1 USDCHF at 0.88563
hidden=1
color=11296515
selectable=0
date1=1610126173
value1=0.885630
</object>

<object>
type=32
name=autotrade #23643050 sell 0.1 USDCHF at 0.88990
hidden=1
color=1918177
selectable=0
date1=1611050487
value1=0.889900
</object>

<object>
type=31
name=autotrade #23652065 buy 0.1 USDCHF at 0.88690
hidden=1
descr=[tp 0.88690]
color=11296515
selectable=0
date1=1611060244
value1=0.886900
</object>

<object>
type=32
name=autotrade #23837287 sell 0.1 USDCHF at 0.88409
hidden=1
color=1918177
selectable=0
date1=1611313220
value1=0.884090
</object>

<object>
type=31
name=autotrade #23853585 buy 0.1 USDCHF at 0.88610
hidden=1
descr=[sl 0.88610]
color=11296515
selectable=0
date1=1611328315
value1=0.886100
</object>

<object>
type=32
name=autotrade #23992624 sell 0.1 USDCHF at 0.88748
hidden=1
color=1918177
selectable=0
date1=1611675558
value1=0.887480
</object>

<object>
type=31
name=autotrade #24040397 buy 0.1 USDCHF at 0.88740
hidden=1
descr=[sl 0.88740]
color=11296515
selectable=0
date1=1611745170
value1=0.887400
</object>

<object>
type=32
name=autotrade #24061549 sell 0.1 USDCHF at 0.88822
hidden=1
color=1918177
selectable=0
date1=1611760195
value1=0.888220
</object>

<object>
type=31
name=autotrade #24073082 buy 0.1 USDCHF at 0.89083
hidden=1
descr=[sl 0.89089]
color=11296515
selectable=0
date1=1611765463
value1=0.890830
</object>

<object>
type=32
name=autotrade #24167432 sell 1 USDCHF at 0.88829
hidden=1
color=1918177
selectable=0
date1=1611851610
value1=0.888290
</object>

<object>
type=31
name=autotrade #24178410 buy 1 USDCHF at 0.88831
hidden=1
descr=[sl 0.88830]
color=11296515
selectable=0
date1=1611856525
value1=0.888310
</object>

<object>
type=32
name=autotrade #24811431 sell 0.1 USDCHF at 0.89593
hidden=1
color=1918177
selectable=0
date1=1612861746
value1=0.895930
</object>

<object>
type=32
name=autotrade #24816955 sell 0.1 USDCHF at 0.89520
hidden=1
color=1918177
selectable=0
date1=1612867538
value1=0.895200
</object>

<object>
type=31
name=autotrade #24837649 buy 0.1 USDCHF at 0.89405
hidden=1
color=11296515
selectable=0
date1=1612885157
value1=0.894050
</object>

<object>
type=31
name=autotrade #24837652 buy 0.1 USDCHF at 0.89404
hidden=1
color=11296515
selectable=0
date1=1612885158
value1=0.894040
</object>

<object>
type=32
name=autotrade #24860677 sell 0.05 USDCHF at 0.89200
hidden=1
color=1918177
selectable=0
date1=1612906396
value1=0.892000
</object>

<object>
type=31
name=autotrade #25024229 buy 0.05 USDCHF at 0.89181
hidden=1
descr=[sl 0.89181]
color=11296515
selectable=0
date1=1613127025
value1=0.891810
</object>

<object>
type=32
name=autotrade #26550545 sell 0.1 USDCHF at 0.93510
hidden=1
color=1918177
selectable=0
date1=1615281411
value1=0.935100
</object>

<object>
type=31
name=autotrade #26566019 buy 0.1 USDCHF at 0.93205
hidden=1
descr=[tp 0.93210]
color=11296515
selectable=0
date1=1615291896
value1=0.932050
</object>

<object>
type=32
name=autotrade #26729796 sell 0.1 USDCHF at 0.92879
hidden=1
color=1918177
selectable=0
date1=1615455278
value1=0.928790
</object>

<object>
type=31
name=autotrade #26735774 buy 0.1 USDCHF at 0.92580
hidden=1
descr=[tp 0.92580]
color=11296515
selectable=0
date1=1615459339
value1=0.925800
</object>

<object>
type=32
name=autotrade #26985048 sell 0.1 USDCHF at 0.92618
hidden=1
color=1918177
selectable=0
date1=1615901176
value1=0.926180
</object>

<object>
type=31
name=autotrade #27000341 buy 0.1 USDCHF at 0.92611
hidden=1
descr=[sl 0.92610]
color=11296515
selectable=0
date1=1615911789
value1=0.926110
</object>

<object>
type=32
name=autotrade #27242583 sell 0.1 USDCHF at 0.92570
hidden=1
color=1918177
selectable=0
date1=1616149880
value1=0.925700
</object>

<object>
type=31
name=autotrade #27251174 buy 0.1 USDCHF at 0.92873
hidden=1
descr=[sl 0.92870]
color=11296515
selectable=0
date1=1616158299
value1=0.928730
</object>

<object>
type=32
name=autotrade #28232946 sell 0.2 USDCHF at 0.92196
hidden=1
color=1918177
selectable=0
date1=1618248237
value1=0.921960
</object>

<object>
type=31
name=autotrade #28255051 buy 0.2 USDCHF at 0.92450
hidden=1
descr=[sl 0.92450]
color=11296515
selectable=0
date1=1618296343
value1=0.924500
</object>

<object>
type=32
name=autotrade #28291806 sell 0.2 USDCHF at 0.92096
hidden=1
color=1918177
selectable=0
date1=1618331865
value1=0.920960
</object>

<object>
type=31
name=autotrade #28303825 buy 0.2 USDCHF at 0.92134
hidden=1
color=11296515
selectable=0
date1=1618341812
value1=0.921340
</object>

<object>
type=32
name=autotrade #28335054 sell 0.2 USDCHF at 0.91890
hidden=1
color=1918177
selectable=0
date1=1618401421
value1=0.918900
</object>

<object>
type=31
name=autotrade #28337671 buy 0.2 USDCHF at 0.92092
hidden=1
descr=[sl 0.92090]
color=11296515
selectable=0
date1=1618404378
value1=0.920920
</object>

<object>
type=32
name=autotrade #28352181 sell 0.2 USDCHF at 0.92182
hidden=1
color=1918177
selectable=0
date1=1618418160
value1=0.921820
</object>

<object>
type=31
name=autotrade #28381938 buy 0.2 USDCHF at 0.92381
hidden=1
descr=[sl 0.92380]
color=11296515
selectable=0
date1=1618461914
value1=0.923810
</object>

<object>
type=32
name=autotrade #28421017 sell 0.2 USDCHF at 0.92109
hidden=1
color=1918177
selectable=0
date1=1618506304
value1=0.921090
</object>

<object>
type=31
name=autotrade #28424412 buy 0.2 USDCHF at 0.92162
hidden=1
color=11296515
selectable=0
date1=1618507425
value1=0.921620
</object>

<object>
type=32
name=autotrade #28424695 sell 0.2 USDCHF at 0.92125
hidden=1
color=1918177
selectable=0
date1=1618507589
value1=0.921250
</object>

<object>
type=31
name=autotrade #28433898 buy 0.2 USDCHF at 0.92311
hidden=1
color=11296515
selectable=0
date1=1618517749
value1=0.923110
</object>

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
type=32
name=autotrade #33345777 sell 0.06 USDCHF at 0.91657
hidden=1
color=1918177
selectable=0
date1=1626948346
value1=0.916570
</object>

<object>
type=31
name=autotrade #33349627 buy 0.06 USDCHF at 0.91848
hidden=1
color=11296515
selectable=0
date1=1626952088
value1=0.918480
</object>

<object>
type=32
name=autotrade #33584697 sell 0.06 USDCHF at 0.91446
hidden=1
color=1918177
selectable=0
date1=1627399201
value1=0.914460
</object>

<object>
type=31
name=autotrade #33676191 buy 0.06 USDCHF at 0.91647
hidden=1
descr=[sl 0.91645]
color=11296515
selectable=0
date1=1627489199
value1=0.916470
</object>

<object>
type=32
name=autotrade #33741108 sell 0.06 USDCHF at 0.90799
hidden=1
color=1918177
selectable=0
date1=1627555238
value1=0.907990
</object>

<object>
type=31
name=autotrade #33787428 buy 0.06 USDCHF at 0.90627
hidden=1
color=11296515
selectable=0
date1=1627600902
value1=0.906270
</object>

<object>
type=32
name=autotrade #33813532 sell 0.06 USDCHF at 0.90456
hidden=1
color=1918177
selectable=0
date1=1627648480
value1=0.904560
</object>

<object>
type=31
name=autotrade #33836863 buy 0.06 USDCHF at 0.90750
hidden=1
descr=[sl 0.90750]
color=11296515
selectable=0
date1=1627666456
value1=0.907500
</object>

<object>
type=32
name=autotrade #33968472 sell 0.06 USDCHF at 0.90332
hidden=1
color=1918177
selectable=0
date1=1627996463
value1=0.903320
</object>

<object>
type=31
name=autotrade #34035518 buy 0.06 USDCHF at 0.90596
hidden=1
descr=[sl 0.90596]
color=11296515
selectable=0
date1=1628076881
value1=0.905960
</object>

<object>
type=32
name=autotrade #34470423 sell 0.04 USDCHF at 0.92169
hidden=1
color=1918177
selectable=0
date1=1628696080
value1=0.921690
</object>

<object>
type=31
name=autotrade #34501422 buy 0.04 USDCHF at 0.92129
hidden=1
descr=[tp 0.92130]
color=11296515
selectable=0
date1=1628710835
value1=0.921290
</object>

<object>
type=32
name=autotrade #34611205 sell 0.06 USDCHF at 0.92015
hidden=1
color=1918177
selectable=0
date1=1628868782
value1=0.920150
</object>

<object>
type=31
name=autotrade #34625115 buy 0.06 USDCHF at 0.91662
hidden=1
descr=[tp 0.91671]
color=11296515
selectable=0
date1=1628875056
value1=0.916620
</object>

<object>
type=32
name=autotrade #35145465 sell 0.06 USDCHF at 0.91349
hidden=1
color=1918177
selectable=0
date1=1629739920
value1=0.913490
</object>

<object>
type=31
name=autotrade #35162668 buy 0.06 USDCHF at 0.91250
hidden=1
color=11296515
selectable=0
date1=1629760343
value1=0.912500
</object>

<object>
type=32
name=autotrade #35690603 sell 0.06 USDCHF at 0.91560
hidden=1
color=1918177
selectable=0
date1=1630511578
value1=0.915600
</object>

<object>
type=31
name=autotrade #35727727 buy 0.06 USDCHF at 0.91554
hidden=1
descr=[sl 0.91550]
color=11296515
selectable=0
date1=1630537094
value1=0.915540
</object>

<object>
type=32
name=autotrade #35811783 sell 0.06 USDCHF at 0.91353
hidden=1
color=1918177
selectable=0
date1=1630629000
value1=0.913530
</object>

<object>
type=32
name=autotrade #35844995 sell 0.04 USDCHF at 0.91347
hidden=1
color=1918177
selectable=0
date1=1630683001
value1=0.913470
</object>

<object>
type=31
name=autotrade #35867830 buy 0.04 USDCHF at 0.91340
hidden=1
descr=[sl 0.91340]
color=11296515
selectable=0
date1=1630687150
value1=0.913400
</object>

<object>
type=31
name=autotrade #35891637 buy 0.06 USDCHF at 0.91315
hidden=1
color=11296515
selectable=0
date1=1630704028
value1=0.913150
</object>

<object>
type=32
name=autotrade #36373968 sell 0.06 USDCHF at 0.92074
hidden=1
color=1918177
selectable=0
date1=1631552753
value1=0.920740
</object>

<object>
type=31
name=autotrade #36488251 buy 0.06 USDCHF at 0.91935
hidden=1
color=11296515
selectable=0
date1=1631656425
value1=0.919350
</object>

<object>
type=32
name=autotrade #36918572 sell 0.06 USDCHF at 0.92891
hidden=1
color=1918177
selectable=0
date1=1632151042
value1=0.928910
</object>

<object>
type=31
name=autotrade #37051885 buy 0.06 USDCHF at 0.92404
hidden=1
color=11296515
selectable=0
date1=1632237347
value1=0.924040
</object>

<object>
type=32
name=autotrade #37253547 sell 0.06 USDCHF at 0.92219
hidden=1
color=1918177
selectable=0
date1=1632416448
value1=0.922190
</object>

<object>
type=31
name=autotrade #37258768 buy 0.06 USDCHF at 0.92262
hidden=1
color=11296515
selectable=0
date1=1632419089
value1=0.922620
</object>

<object>
type=31
name=autotrade #37513036 buy 0.06 USDCHF at 0.93000
hidden=1
color=11296515
selectable=0
date1=1632847612
value1=0.930000
</object>

<object>
type=32
name=autotrade #37519431 sell 0.06 USDCHF at 0.92803
hidden=1
color=1918177
selectable=0
date1=1632849324
value1=0.928030
</object>

<object>
type=32
name=autotrade #37522036 sell 0.06 USDCHF at 0.92663
hidden=1
color=1918177
selectable=0
date1=1632849895
value1=0.926630
</object>

<object>
type=31
name=autotrade #37573229 buy 0.06 USDCHF at 0.93071
hidden=1
descr=[sl 0.93066]
color=11296515
selectable=0
date1=1632910026
value1=0.930710
</object>

<object>
type=32
name=autotrade #38253185 sell 0.06 USDCHF at 0.92712
hidden=1
color=1918177
selectable=0
date1=1633707001
value1=0.927120
</object>

<object>
type=31
name=autotrade #38269820 buy 0.06 USDCHF at 0.92753
hidden=1
color=11296515
selectable=0
date1=1633710603
value1=0.927530
</object>

<object>
type=32
name=autotrade #38448929 sell 0.1 USDCHF at 0.92900
hidden=1
color=1918177
selectable=0
date1=1634061461
value1=0.929000
</object>

<object>
type=31
name=autotrade #38456633 buy 0.1 USDCHF at 0.93130
hidden=1
descr=[sl 0.93130]
color=11296515
selectable=0
date1=1634068827
value1=0.931300
</object>

<object>
type=2
name=autotrade #16308442 -> #16325434 USDCHF
hidden=1
descr=0.90960 -> 0.91161
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1596740636
date2=1596777993
value1=0.909600
value2=0.911610
</object>

<object>
type=2
name=autotrade #16336879 -> #16338542 USDCHF
hidden=1
descr=0.91051 -> 0.91240
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1596795314
date2=1596797451
value1=0.910510
value2=0.912400
</object>

<object>
type=2
name=autotrade #17072202 -> #17093087 USDCHF
hidden=1
descr=0.90967 -> 0.90963
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1598268254
date2=1598289235
value1=0.909670
value2=0.909630
</object>

<object>
type=2
name=autotrade #17583562 -> #17593611 USDCHF
hidden=1
descr=0.90951 -> 0.91149
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1599152508
date2=1599157325
value1=0.909510
value2=0.911490
</object>

<object>
type=2
name=autotrade #17714285 -> #17747154 USDCHF
hidden=1
descr=0.91829 -> 0.91829
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1599559817
date2=1599584580
value1=0.918290
value2=0.918290
</object>

<object>
type=2
name=autotrade #18125247 -> #18140850 USDCHF
hidden=1
descr=0.90966 -> 0.90998
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1600357828
date2=1600370273
value1=0.909660
value2=0.909980
</object>

<object>
type=2
name=autotrade #18168599 -> #18176493 USDCHF
hidden=1
descr=0.90910 -> 0.90920
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1600436448
date2=1600445088
value1=0.909100
value2=0.909200
</object>

<object>
type=2
name=autotrade #18185479 -> #18187726 USDCHF
hidden=1
descr=0.90981 -> 0.90973
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1600450814
date2=1600452029
value1=0.909810
value2=0.909730
</object>

<object>
type=2
name=autotrade #18597224 -> #18616651 USDCHF
hidden=1
descr=0.92319 -> 0.91988
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1601380485
date2=1601398926
value1=0.923190
value2=0.919880
</object>

<object>
type=2
name=autotrade #18838375 -> #18870297 USDCHF
hidden=1
descr=0.91563 -> 0.91563
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1601901228
date2=1601938834
value1=0.915630
value2=0.915630
</object>

<object>
type=2
name=autotrade #19401600 -> #19404863 USDCHF
hidden=1
descr=0.91650 -> 0.91450
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1603101446
date2=1603104726
value1=0.916500
value2=0.914500
</object>

<object>
type=2
name=autotrade #19498107 -> #19504041 USDCHF
hidden=1
descr=0.90680 -> 0.90680
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1603213659
date2=1603216859
value1=0.906800
value2=0.906800
</object>

<object>
type=2
name=autotrade #19508521 -> #19513897 USDCHF
hidden=1
descr=0.90680 -> 0.90672
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1603221327
date2=1603229283
value1=0.906800
value2=0.906720
</object>

<object>
type=2
name=autotrade #19540186 -> #19558444 USDCHF
hidden=1
descr=0.90420 -> 0.90423
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1603277764
date2=1603296172
value1=0.904200
value2=0.904230
</object>

<object>
type=2
name=autotrade #20026489 -> #20058604 USDCHF
hidden=1
descr=0.91845 -> 0.92025
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1604313248
date2=1604350641
value1=0.918450
value2=0.920250
</object>

<object>
type=2
name=autotrade #22139635 -> #22208765 USDCHF
hidden=1
descr=0.88740 -> 0.88448
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1608022057
date2=1608114602
value1=0.887400
value2=0.884480
</object>

<object>
type=2
name=autotrade #23165271 -> #23173553 USDCHF
hidden=1
descr=0.88765 -> 0.88565
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1610100351
date2=1610108128
value1=0.887650
value2=0.885650
</object>

<object>
type=2
name=autotrade #23185523 -> #23193491 USDCHF
hidden=1
descr=0.88264 -> 0.88461
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1610120714
date2=1610124328
value1=0.882640
value2=0.884610
</object>

<object>
type=2
name=autotrade #23194303 -> #23198984 USDCHF
hidden=1
descr=0.88410 -> 0.88563
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1610124544
date2=1610126173
value1=0.884100
value2=0.885630
</object>

<object>
type=2
name=autotrade #23643050 -> #23652065 USDCHF
hidden=1
descr=0.88990 -> 0.88690
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1611050487
date2=1611060244
value1=0.889900
value2=0.886900
</object>

<object>
type=2
name=autotrade #23837287 -> #23853585 USDCHF
hidden=1
descr=0.88409 -> 0.88610
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1611313220
date2=1611328315
value1=0.884090
value2=0.886100
</object>

<object>
type=2
name=autotrade #23992624 -> #24040397 USDCHF
hidden=1
descr=0.88748 -> 0.88740
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1611675558
date2=1611745170
value1=0.887480
value2=0.887400
</object>

<object>
type=2
name=autotrade #24061549 -> #24073082 USDCHF
hidden=1
descr=0.88822 -> 0.89083
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1611760195
date2=1611765463
value1=0.888220
value2=0.890830
</object>

<object>
type=2
name=autotrade #24167432 -> #24178410 USDCHF
hidden=1
descr=0.88829 -> 0.88831
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1611851610
date2=1611856525
value1=0.888290
value2=0.888310
</object>

<object>
type=2
name=autotrade #24811431 -> #24837649 USDCHF
hidden=1
descr=0.89593 -> 0.89405
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1612861746
date2=1612885157
value1=0.895930
value2=0.894050
</object>

<object>
type=2
name=autotrade #24816955 -> #24837652 USDCHF
hidden=1
descr=0.89520 -> 0.89404
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1612867538
date2=1612885158
value1=0.895200
value2=0.894040
</object>

<object>
type=2
name=autotrade #24860677 -> #25024229 USDCHF
hidden=1
descr=0.89200 -> 0.89181
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1612906396
date2=1613127025
value1=0.892000
value2=0.891810
</object>

<object>
type=2
name=autotrade #26550545 -> #26566019 USDCHF
hidden=1
descr=0.93510 -> 0.93205
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1615281411
date2=1615291896
value1=0.935100
value2=0.932050
</object>

<object>
type=2
name=autotrade #26729796 -> #26735774 USDCHF
hidden=1
descr=0.92879 -> 0.92580
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1615455278
date2=1615459339
value1=0.928790
value2=0.925800
</object>

<object>
type=2
name=autotrade #26985048 -> #27000341 USDCHF
hidden=1
descr=0.92618 -> 0.92611
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1615901176
date2=1615911789
value1=0.926180
value2=0.926110
</object>

<object>
type=2
name=autotrade #27242583 -> #27251174 USDCHF
hidden=1
descr=0.92570 -> 0.92873
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1616149880
date2=1616158299
value1=0.925700
value2=0.928730
</object>

<object>
type=2
name=autotrade #28232946 -> #28255051 USDCHF
hidden=1
descr=0.92196 -> 0.92450
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1618248237
date2=1618296343
value1=0.921960
value2=0.924500
</object>

<object>
type=2
name=autotrade #28291806 -> #28303825 USDCHF
hidden=1
descr=0.92096 -> 0.92134
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1618331865
date2=1618341812
value1=0.920960
value2=0.921340
</object>

<object>
type=2
name=autotrade #28335054 -> #28337671 USDCHF
hidden=1
descr=0.91890 -> 0.92092
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1618401421
date2=1618404378
value1=0.918900
value2=0.920920
</object>

<object>
type=2
name=autotrade #28352181 -> #28381938 USDCHF
hidden=1
descr=0.92182 -> 0.92381
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1618418160
date2=1618461914
value1=0.921820
value2=0.923810
</object>

<object>
type=2
name=autotrade #28421017 -> #28424412 USDCHF
hidden=1
descr=0.92109 -> 0.92162
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1618506304
date2=1618507425
value1=0.921090
value2=0.921620
</object>

<object>
type=2
name=autotrade #28424695 -> #28433898 USDCHF
hidden=1
descr=0.92125 -> 0.92311
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1618507589
date2=1618517749
value1=0.921250
value2=0.923110
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
type=2
name=autotrade #33345777 -> #33349627 USDCHF
hidden=1
descr=0.91657 -> 0.91848
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1626948346
date2=1626952088
value1=0.916570
value2=0.918480
</object>

<object>
type=2
name=autotrade #33584697 -> #33676191 USDCHF
hidden=1
descr=0.91446 -> 0.91647
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1627399201
date2=1627489199
value1=0.914460
value2=0.916470
</object>

<object>
type=2
name=autotrade #33741108 -> #33787428 USDCHF
hidden=1
descr=0.90799 -> 0.90627
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1627555238
date2=1627600902
value1=0.907990
value2=0.906270
</object>

<object>
type=2
name=autotrade #33813532 -> #33836863 USDCHF
hidden=1
descr=0.90456 -> 0.90750
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1627648480
date2=1627666456
value1=0.904560
value2=0.907500
</object>

<object>
type=2
name=autotrade #33968472 -> #34035518 USDCHF
hidden=1
descr=0.90332 -> 0.90596
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1627996463
date2=1628076881
value1=0.903320
value2=0.905960
</object>

<object>
type=2
name=autotrade #34470423 -> #34501422 USDCHF
hidden=1
descr=0.92169 -> 0.92129
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1628696080
date2=1628710835
value1=0.921690
value2=0.921290
</object>

<object>
type=2
name=autotrade #34611205 -> #34625115 USDCHF
hidden=1
descr=0.92015 -> 0.91662
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1628868782
date2=1628875056
value1=0.920150
value2=0.916620
</object>

<object>
type=2
name=autotrade #35145465 -> #35162668 USDCHF
hidden=1
descr=0.91349 -> 0.91250
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1629739920
date2=1629760343
value1=0.913490
value2=0.912500
</object>

<object>
type=2
name=autotrade #35690603 -> #35727727 USDCHF
hidden=1
descr=0.91560 -> 0.91554
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1630511578
date2=1630537094
value1=0.915600
value2=0.915540
</object>

<object>
type=2
name=autotrade #35811783 -> #35891637 USDCHF
hidden=1
descr=0.91353 -> 0.91315
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1630629000
date2=1630704028
value1=0.913530
value2=0.913150
</object>

<object>
type=2
name=autotrade #35844995 -> #35867830 USDCHF
hidden=1
descr=0.91347 -> 0.91340
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1630683001
date2=1630687150
value1=0.913470
value2=0.913400
</object>

<object>
type=2
name=autotrade #36373968 -> #36488251 USDCHF
hidden=1
descr=0.92074 -> 0.91935
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1631552753
date2=1631656425
value1=0.920740
value2=0.919350
</object>

<object>
type=2
name=autotrade #36918572 -> #37051885 USDCHF
hidden=1
descr=0.92891 -> 0.92404
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1632151042
date2=1632237347
value1=0.928910
value2=0.924040
</object>

<object>
type=2
name=autotrade #37253547 -> #37258768 USDCHF
hidden=1
descr=0.92219 -> 0.92262
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1632416448
date2=1632419089
value1=0.922190
value2=0.922620
</object>

<object>
type=2
name=autotrade #37513036 -> #37519431 USDCHF
hidden=1
descr=0.93000 -> 0.92803
color=11296515
style=2
selectable=0
ray1=0
ray2=0
date1=1632847612
date2=1632849324
value1=0.930000
value2=0.928030
</object>

<object>
type=2
name=autotrade #37522036 -> #37573229 USDCHF
hidden=1
descr=0.92663 -> 0.93071
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1632849895
date2=1632910026
value1=0.926630
value2=0.930710
</object>

<object>
type=2
name=autotrade #38253185 -> #38269820 USDCHF
hidden=1
descr=0.92712 -> 0.92753
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1633707001
date2=1633710603
value1=0.927120
value2=0.927530
</object>

<object>
type=2
name=autotrade #38448929 -> #38456633 USDCHF
hidden=1
descr=0.92900 -> 0.93130
color=1918177
style=2
selectable=0
ray1=0
ray2=0
date1=1634061461
date2=1634068827
value1=0.929000
value2=0.931300
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.01.05 06:001EST
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1609783200
date2=1609824600
value1=0.879170
value2=0.879890
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.01.05 06:001ESTArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1609826400
value1=0.879940
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.01.12 04:001
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1610413200
date2=1610422200
value1=0.890320
value2=0.891310
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.01.12 04:001Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1610424000
value1=0.891080
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.01.19 10:001RSI
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1610652600
date2=1611050400
value1=0.885580
value2=0.888720
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.01.19 10:001RSIArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1611050400
value1=0.888720
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.01.19 13:001EST
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1610652600
date2=1611059400
value1=0.885580
value2=0.886770
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.01.19 13:001ESTArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1611061200
value1=0.886780
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.01.25 17:001
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1611221400
date2=1611594000
value1=0.889700
value2=0.889270
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.01.25 17:001Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1611594000
value1=0.889270
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.01.25 18:001
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1611196200
date2=1611597600
value1=0.889950
value2=0.889280
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.01.25 18:001Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1611597600
value1=0.889280
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.02.01 11:001
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1611160200
date2=1612177200
value1=0.892050
value2=0.895730
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.02.01 11:001Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1612177200
value1=0.895730
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.02.23 13:301
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1613989800
date2=1614085200
value1=0.902370
value2=0.901200
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.02.23 13:301Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1614087000
value1=0.900770
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.03.05 18:001
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1614938400
date2=1614967200
value1=0.931130
value2=0.931910
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.03.05 18:001Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1614967200
value1=0.931910
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.03.15 09:001
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1615568400
date2=1615798800
value1=0.932510
value2=0.931150
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.03.15 09:001Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1615798800
value1=0.931150
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.03.16 06:001RSI
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1615834800
date2=1615874400
value1=0.926680
value2=0.926440
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.03.16 06:001RSIArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1615874400
value1=0.926440
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.03.17 13:001RSI
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1615973400
date2=1615986000
value1=0.925370
value2=0.925440
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.03.17 13:001RSIArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1615986000
value1=0.925440
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.03.22 16:001MACD
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1616067000
date2=1616428800
value1=0.923210
value2=0.924090
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.03.22 16:001MACDArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1616428800
value1=0.924090
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.03.24 07:301
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1616558400
date2=1616571000
value1=0.934620
value2=0.934640
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.03.24 07:301Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1616571000
value1=0.934640
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.03.30 10:301
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1616990400
date2=1617100200
value1=0.940290
value2=0.942320
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.03.30 10:301Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1617100200
value1=0.942320
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.04.06 19:301MACD
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1617651000
date2=1617735600
value1=0.935900
value2=0.932140
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.04.06 19:301MACDArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1617737400
value1=0.932350
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.04.06 23:001MACD
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1617651000
date2=1617750000
value1=0.935900
value2=0.930280
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.04.06 23:001MACDArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1617750000
value1=0.930280
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.04.09 19:001RSI
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1617962400
date2=1617994800
value1=0.923960
value2=0.924900
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.04.09 19:001RSIArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1617994800
value1=0.924900
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.04.09 20:301EST
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1617940800
date2=1618000200
value1=0.923660
value2=0.924330
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.04.09 20:301ESTArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1618000200
value1=0.924330
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.04.21 14:001
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1619004600
date2=1619013600
value1=0.918530
value2=0.918620
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.04.21 14:001Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1619013600
value1=0.918620
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.04.21 14:301
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1618813800
date2=1619013600
value1=0.921110
value2=0.918620
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.04.21 14:301Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1619015400
value1=0.918400
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.04.22 09:301RSI
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1618898400
date2=1619083800
value1=0.913510
value2=0.914520
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.04.22 09:301RSIArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1619083800
value1=0.914520
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.05.06 15:001MACD
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1619776800
date2=1620313200
value1=0.908030
value2=0.908080
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.05.06 15:001MACDArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1620313200
value1=0.908080
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.05.07 19:001EST
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1620345600
date2=1620412200
value1=0.907020
value2=0.900810
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.05.07 19:001ESTArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1620414000
value1=0.900940
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.05.11 21:001
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1620730800
date2=1620766800
value1=0.903290
value2=0.903940
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.05.11 21:001Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1620766800
value1=0.903940
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.05.12 07:001
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1620399600
date2=1620802800
value1=0.909360
value2=0.905850
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.05.12 07:001Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1620802800
value1=0.905850
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.05.26 20:301
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1622044800
date2=1622061000
value1=0.897380
value2=0.898740
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.05.26 20:301Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1622061000
value1=0.898740
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.05.28 16:001
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1621485000
date2=1622215800
value1=0.904710
value2=0.902970
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.05.28 16:001Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1622217600
value1=0.902920
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.06.02 14:301
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1620847800
date2=1622642400
value1=0.909390
value2=0.902460
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.06.02 14:301Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1622644200
value1=0.902180
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.06.09 12:301RSI
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1623173400
date2=1623241800
value1=0.895340
value2=0.895460
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.06.09 12:301RSIArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1623241800
value1=0.895460
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.06.16 10:301EST
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1623801600
date2=1623839400
value1=0.897350
value2=0.897730
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.06.16 10:301ESTArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1623839400
value1=0.897730
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.06.22 22:301MACD
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1624314600
date2=1624399200
value1=0.917570
value2=0.917300
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.06.22 22:301MACDArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1624401000
value1=0.917550
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.07.15 20:001
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1626192000
date2=1626379200
value1=0.920050
value2=0.919310
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.07.15 20:001Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1626379200
value1=0.919310
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.07.21 09:001
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1626843600
date2=1626858000
value1=0.921940
value2=0.922200
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.07.21 09:001Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1626858000
value1=0.922200
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.07.21 22:001EST
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1626714000
date2=1626904800
value1=0.916310
value2=0.916960
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.07.21 22:001ESTArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1626904800
value1=0.916960
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.07.27 16:301MACD
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1627345800
date2=1627401600
value1=0.914890
value2=0.913530
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.07.27 16:301MACDArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1627403400
value1=0.913920
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.07.27 20:301MACD
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1627331400
date2=1627417800
value1=0.914860
value2=0.912920
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.07.27 20:301MACDArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1627417800
value1=0.912920
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.07.29 22:001EST
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1627581600
date2=1627596000
value1=0.905500
value2=0.905440
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.07.29 22:001ESTArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1627596000
value1=0.905440
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.08.09 18:001
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1628515800
date2=1628532000
value1=0.917380
value2=0.919650
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.08.09 18:001Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1628532000
value1=0.919650
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.08.13 20:301MACD
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1628094600
date2=1628886600
value1=0.901830
value2=0.915210
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.08.13 20:301MACDArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1628886600
value1=0.915210
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.09.01 21:001
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1630521000
date2=1630530000
value1=0.915400
value2=0.915290
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.09.01 21:001Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1630530000
value1=0.915290
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.09.14 20:301MACD
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1631275200
date2=1631649600
value1=0.915010
value2=0.918120
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.09.14 20:301MACDArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1631651400
value1=0.918240
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.09.15 12:301EST
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1631275200
date2=1631709000
value1=0.915010
value2=0.916830
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.09.15 12:301ESTArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1631709000
value1=0.916830
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.09.17 16:001
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1631835000
date2=1631894400
value1=0.927810
value2=0.929600
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.09.17 16:001Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1631894400
value1=0.929600
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.09.20 03:301
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1632099600
date2=1632108600
value1=0.932570
value2=0.932470
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.09.20 03:301Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1632108600
value1=0.932470
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.09.23 04:001
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1632132000
date2=1632367800
value1=0.933290
value2=0.927380
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.09.23 04:001Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1632369600
value1=0.927290
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.09.27 06:001
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1632502800
date2=1632722400
value1=0.925780
value2=0.925580
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.09.27 06:001Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1632722400
value1=0.925580
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.09.27 06:301
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1632502800
date2=1632722400
value1=0.925780
value2=0.925580
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.09.27 06:301Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1632724200
value1=0.925460
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.10.04 15:301EST
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1631712600
date2=1633361400
value1=0.916380
value2=0.924190
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.10.04 15:301ESTArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1633361400
value1=0.924190
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.10.08 05:001
hidden=1
color=16776960
background=1
selectable=0
ray1=0
ray2=0
date1=1633645800
date2=1633669200
value1=0.929220
value2=0.929440
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.10.08 05:001Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1633669200
value1=0.929440
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.10.11 11:001EST
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1633910400
date2=1633950000
value1=0.925370
value2=0.925920
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.10.11 11:001ESTArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1633950000
value1=0.925920
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.10.18 08:001
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1634311800
date2=1634542200
value1=0.926400
value2=0.925190
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.10.18 08:001Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1634544000
value1=0.925130
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.10.20 05:301
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1634562000
date2=1634706000
value1=0.927300
value2=0.924360
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.10.20 05:301Arrow
hidden=1
color=42495
background=1
selectable=0
anchorpos=1
code_arrow=222
date1=1634707800
value1=0.924350
</object>

<object>
type=2
name=Divergence_TVI_1234Divergence2021.10.20 21:001MACD
hidden=1
color=16711935
background=1
selectable=0
ray1=0
ray2=0
date1=1634648400
date2=1634761800
value1=0.918520
value2=0.918620
</object>

<object>
type=100
name=Divergence_TVI_1234Divergence2021.10.20 21:001MACDArrow
hidden=1
color=8388352
background=1
selectable=0
code_arrow=221
date1=1634763600
value1=0.918790
</object>

</window>
</chart>