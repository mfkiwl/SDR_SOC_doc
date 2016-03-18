<Qucs Schematic 0.0.18>
<Properties>
  <View=-94,-261,1073,801,0.683014,0,0>
  <Grid=10,10,1>
  <DataSet=DP40MHz.dat>
  <DataDisplay=DP40MHz.dpl>
  <OpenDisplay=1>
  <Script=DP40MHz.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
  <.ID -20 -16 SUB>
  <Line -20 20 40 0 #000080 2 1>
  <Line 20 20 0 -40 #000080 2 1>
  <Line -20 -20 40 0 #000080 2 1>
  <Line -20 20 0 -40 #000080 2 1>
</Symbol>
<Components>
  <.AC AC1 1 40 -50 0 43 0 0 "lin" 1 "1 MHz" 1 "1 GHz" 1 "100000" 1 "no" 0>
  <R R3 1 160 440 15 -26 0 1 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <Vac V2 1 60 440 18 -26 0 1 "1 V" 1 "1 GHz" 0 "0" 0 "0" 0>
  <GND * 1 60 470 0 0 0 0>
  <GND * 1 160 470 0 0 0 0>
  <GND * 1 280 470 0 0 0 0>
  <R R4 1 580 440 15 -26 0 1 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND * 1 480 470 0 0 0 0>
  <GND * 1 580 470 0 0 0 0>
  <C C5 1 280 440 17 -26 0 1 "68 pF" 1 "" 0 "neutral" 0>
  <C C6 1 480 440 17 -26 0 1 "68 pF" 1 "" 0 "neutral" 0>
  <L L5 1 410 390 -26 10 0 0 "300 nH" 1 "" 0>
</Components>
<Wires>
  <160 390 160 410 "" 0 0 0 "">
  <160 390 280 390 "" 0 0 0 "">
  <280 390 280 410 "" 0 0 0 "">
  <60 390 60 410 "" 0 0 0 "">
  <60 390 160 390 "" 0 0 0 "">
  <580 390 580 410 "" 0 0 0 "">
  <440 390 480 390 "" 0 0 0 "">
  <480 390 580 390 "" 0 0 0 "">
  <480 390 480 410 "" 0 0 0 "">
  <280 390 380 390 "" 0 0 0 "">
  <580 390 580 390 "DP20MHz" 610 360 0 "">
</Wires>
<Diagrams>
  <Rect 375 271 683 419 3 #c0c0c0 1 10 1 1e+06 1 1e+09 1 -0.100638 0.2 1.10769 1 -1 0.2 1 315 0 225 "" "" "">
	<"DP20MHz.v" #ff0000 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
</Paintings>
