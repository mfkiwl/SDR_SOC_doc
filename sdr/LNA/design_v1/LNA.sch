EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:SDRlib
LIBS:LNA-cache
EELAYER 25 0
EELAYER END
$Descr User 8268 5827
encoding utf-8
Sheet 1 1
Title "LNA with KF630D"
Date ""
Rev "1.0"
Comp "SPSEOL"
Comment1 "created by wykys"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MLW6 P2
U 1 1 54D7FA75
P 1900 4100
F 0 "P2" H 1750 4300 40  0000 L CNN
F 1 "MLW6" H 1900 3875 40  0000 C CNN
F 2 "SDRlib:vasch_strip_3x2_90" H 2650 3650 60  0001 C CNN
F 3 "" H 2650 3650 60  0000 C CNN
	1    1900 4100
	-1   0    0    1   
$EndComp
$Comp
L +12V #PWR01
U 1 1 54D7FF7D
P 1550 4650
F 0 "#PWR01" H 1550 4500 60  0001 C CNN
F 1 "+12V" H 1550 4790 60  0000 C CNN
F 2 "" H 1550 4650 60  0000 C CNN
F 3 "" H 1550 4650 60  0000 C CNN
	1    1550 4650
	-1   0    0    1   
$EndComp
$Comp
L +12V #PWR02
U 1 1 54D7FF8F
P 2450 4650
F 0 "#PWR02" H 2450 4500 60  0001 C CNN
F 1 "+12V" H 2450 4790 60  0000 C CNN
F 2 "" H 2450 4650 60  0000 C CNN
F 3 "" H 2450 4650 60  0000 C CNN
	1    2450 4650
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR03
U 1 1 54D7FFA1
P 1550 3950
F 0 "#PWR03" H 1550 3800 60  0001 C CNN
F 1 "+5V" H 1550 4090 60  0000 C CNN
F 2 "" H 1550 3950 60  0000 C CNN
F 3 "" H 1550 3950 60  0000 C CNN
	1    1550 3950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 54D7FFD9
P 1500 4100
F 0 "#PWR04" H 1500 3850 60  0001 C CNN
F 1 "GND" H 1500 3950 60  0000 C CNN
F 2 "" H 1500 4100 60  0000 C CNN
F 3 "" H 1500 4100 60  0000 C CNN
	1    1500 4100
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR05
U 1 1 54D81276
P 2450 3950
F 0 "#PWR05" H 2450 3800 60  0001 C CNN
F 1 "+5V" H 2450 4090 60  0000 C CNN
F 2 "" H 2450 3950 60  0000 C CNN
F 3 "" H 2450 3950 60  0000 C CNN
	1    2450 3950
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 54E4A3AD
P 4900 1350
F 0 "R1" V 4980 1350 50  0000 C CNN
F 1 "560R" V 4907 1351 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 4830 1350 30  0001 C CNN
F 3 "" H 4900 1350 30  0000 C CNN
	1    4900 1350
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 54E4A3B3
P 4900 2350
F 0 "R2" V 4980 2350 50  0000 C CNN
F 1 "500R" V 4907 2351 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 4830 2350 30  0001 C CNN
F 3 "" H 4900 2350 30  0000 C CNN
	1    4900 2350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 54E4A3C1
P 4900 2900
F 0 "#PWR06" H 4900 2650 60  0001 C CNN
F 1 "GND" H 4900 2750 60  0000 C CNN
F 2 "" H 4900 2900 60  0000 C CNN
F 3 "" H 4900 2900 60  0000 C CNN
	1    4900 2900
	1    0    0    -1  
$EndComp
$Comp
L C C7
U 1 1 54E4A3C9
P 4450 1850
F 0 "C7" V 4500 1900 50  0000 L CNN
F 1 "100n" V 4500 1600 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 4488 1700 30  0001 C CNN
F 3 "" H 4450 1850 60  0000 C CNN
	1    4450 1850
	0    1    1    0   
$EndComp
$Comp
L +12V #PWR07
U 1 1 54E4A3D6
P 6550 2600
F 0 "#PWR07" H 6550 2450 60  0001 C CNN
F 1 "+12V" H 6550 2740 60  0000 C CNN
F 2 "" H 6550 2600 60  0000 C CNN
F 3 "" H 6550 2600 60  0000 C CNN
	1    6550 2600
	1    0    0    -1  
$EndComp
$Comp
L C C10
U 1 1 54E4A3E2
P 6250 2950
F 0 "C10" H 6300 3050 50  0000 L CNN
F 1 "100n" H 6300 2850 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 6288 2800 30  0001 C CNN
F 3 "" H 6250 2950 60  0000 C CNN
	1    6250 2950
	-1   0    0    1   
$EndComp
$Comp
L BNC P3
U 1 1 54E4A3EA
P 7350 1600
F 0 "P3" H 7360 1720 50  0000 C CNN
F 1 "LNA_OUT" V 7460 1540 50  0000 C CNN
F 2 "SDRlib:sma_90_r300.124.403" H 7350 1600 60  0001 C CNN
F 3 "" H 7350 1600 60  0000 C CNN
	1    7350 1600
	1    0    0    -1  
$EndComp
$Comp
L C C11
U 1 1 54E4A3F0
P 6750 1600
F 0 "C11" V 6800 1650 50  0000 L CNN
F 1 "100n" V 6800 1350 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 6788 1450 30  0001 C CNN
F 3 "" H 6750 1600 60  0000 C CNN
	1    6750 1600
	0    1    1    0   
$EndComp
$Comp
L R R4
U 1 1 54E4A40B
P 5550 2950
F 0 "R4" V 5630 2950 50  0000 C CNN
F 1 "12R" V 5557 2951 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 5480 2950 30  0001 C CNN
F 3 "" H 5550 2950 30  0000 C CNN
	1    5550 2950
	1    0    0    -1  
$EndComp
$Comp
L BC413 Q1
U 1 1 54E4A419
P 5450 1850
F 0 "Q1" H 5450 1701 40  0000 R CNN
F 1 "KF630D" H 5450 2000 40  0000 R CNN
F 2 "Transistors_OldSowjetAera:OldSowjetaera_Transistor_Type-II_BigPads" H 5350 1952 29  0001 C CNN
F 3 "" H 5450 1850 60  0000 C CNN
	1    5450 1850
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 54E4AB32
P 5550 2350
F 0 "R3" V 5630 2350 50  0000 C CNN
F 1 "4R7" V 5557 2351 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 5480 2350 30  0001 C CNN
F 3 "" H 5550 2350 30  0000 C CNN
	1    5550 2350
	1    0    0    -1  
$EndComp
$Comp
L C C8
U 1 1 54E4B8E8
P 5350 2950
F 0 "C8" H 5400 3050 50  0000 L CNN
F 1 "100n" H 5400 2850 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 5388 2800 30  0001 C CNN
F 3 "" H 5350 2950 60  0000 C CNN
	1    5350 2950
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR08
U 1 1 54E4A411
P 5550 3300
F 0 "#PWR08" H 5550 3050 60  0001 C CNN
F 1 "GND" H 5550 3150 60  0000 C CNN
F 2 "" H 5550 3300 60  0000 C CNN
F 3 "" H 5550 3300 60  0000 C CNN
	1    5550 3300
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 54E4FCE2
P 5700 1050
F 0 "R5" V 5780 1050 50  0000 C CNN
F 1 "3k3" V 5707 1051 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 5630 1050 30  0001 C CNN
F 3 "" H 5700 1050 30  0000 C CNN
	1    5700 1050
	0    1    1    0   
$EndComp
$Comp
L C C9
U 1 1 54E4FD60
P 5700 800
F 0 "C9" V 5750 850 50  0000 L CNN
F 1 "100n" V 5750 550 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 5738 650 30  0001 C CNN
F 3 "" H 5700 800 60  0000 C CNN
	1    5700 800 
	0    1    1    0   
$EndComp
$Comp
L GND #PWR09
U 1 1 54E4A3DC
P 6250 3300
F 0 "#PWR09" H 6250 3050 60  0001 C CNN
F 1 "GND" H 6250 3150 60  0000 C CNN
F 2 "" H 6250 3300 60  0000 C CNN
F 3 "" H 6250 3300 60  0000 C CNN
	1    6250 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 54E522EA
P 7350 2200
F 0 "#PWR010" H 7350 1950 60  0001 C CNN
F 1 "GND" H 7350 2050 60  0000 C CNN
F 2 "" H 7350 2200 60  0000 C CNN
F 3 "" H 7350 2200 60  0000 C CNN
	1    7350 2200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 54D7FFC5
P 2800 4100
F 0 "#PWR011" H 2800 3850 60  0001 C CNN
F 1 "GND" H 2800 3950 60  0000 C CNN
F 2 "" H 2800 4100 60  0000 C CNN
F 3 "" H 2800 4100 60  0000 C CNN
	1    2800 4100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2450 4500 2450 4650
Wire Wire Line
	2450 4600 2250 4600
Wire Wire Line
	2250 4600 2250 4200
Wire Wire Line
	2250 4200 2200 4200
Connection ~ 2450 4600
Connection ~ 2450 4100
Wire Wire Line
	1550 4650 1550 4200
Wire Wire Line
	1550 4200 1600 4200
Wire Wire Line
	1500 4100 1600 4100
Wire Wire Line
	4900 1500 4900 2200
Connection ~ 4900 1850
Wire Wire Line
	4900 2500 4900 2900
Wire Wire Line
	6900 1600 7200 1600
Wire Wire Line
	5550 2050 5550 2200
Wire Wire Line
	5550 2500 5550 2800
Wire Wire Line
	5550 3100 5550 3300
Wire Wire Line
	5350 2650 5350 2800
Wire Wire Line
	5350 2650 5550 2650
Connection ~ 5550 2650
Wire Wire Line
	5350 3100 5350 3250
Wire Wire Line
	5350 3250 5550 3250
Connection ~ 5550 3250
Wire Wire Line
	5550 1650 5550 1600
Wire Wire Line
	5550 1600 6050 1600
Wire Wire Line
	6050 1600 6050 1650
Wire Wire Line
	6050 2350 6050 2400
Wire Wire Line
	6050 2400 6400 2400
Wire Wire Line
	6400 2400 6400 800 
Wire Wire Line
	6250 1600 6600 1600
Wire Wire Line
	6250 1600 6250 1650
Wire Wire Line
	6550 2600 6550 2650
Wire Wire Line
	6550 2650 6250 2650
Wire Wire Line
	6250 2350 6250 2800
Connection ~ 6250 2650
Wire Wire Line
	6250 3100 6250 3300
Connection ~ 6400 1600
Wire Wire Line
	7350 2200 7350 1800
Wire Wire Line
	4600 1850 5250 1850
Wire Wire Line
	4900 1050 5550 1050
Wire Wire Line
	4900 800  4900 1200
Wire Wire Line
	4900 800  5550 800 
Connection ~ 4900 1050
Wire Wire Line
	5850 1050 6400 1050
Wire Wire Line
	6400 800  5850 800 
Connection ~ 6400 1050
Wire Wire Line
	2200 4100 2800 4100
$Comp
L GND #PWR012
U 1 1 54EF8650
P 1400 2900
F 0 "#PWR012" H 1400 2650 60  0001 C CNN
F 1 "GND" H 1400 2750 60  0000 C CNN
F 2 "" H 1400 2900 60  0000 C CNN
F 3 "" H 1400 2900 60  0000 C CNN
	1    1400 2900
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 55201DAB
P 2650 2000
F 0 "C2" H 2675 2100 50  0000 L CNN
F 1 "100p" H 2675 1900 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 2688 1850 30  0001 C CNN
F 3 "" H 2650 2000 60  0000 C CNN
	1    2650 2000
	1    0    0    -1  
$EndComp
$Comp
L CTRIM C3
U 1 1 55201E4F
P 2650 2400
F 0 "C3" H 2800 2500 50  0000 C CNN
F 1 "6-50p" H 2800 2300 50  0000 C CNN
F 2 "SDRlib:CT-6-50p" H 2650 2400 60  0001 C CNN
F 3 "" H 2650 2400 60  0000 C CNN
	1    2650 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 1650 2050 1600
Wire Wire Line
	2050 1600 2650 1600
Wire Wire Line
	2650 1600 2650 1850
Wire Wire Line
	2050 2750 2050 2800
Wire Wire Line
	2050 2800 2650 2800
Wire Wire Line
	2650 2800 2650 2550
Wire Wire Line
	2650 2250 2650 2150
$Comp
L C C5
U 1 1 552026ED
P 3250 2000
F 0 "C5" H 3275 2100 50  0000 L CNN
F 1 "100p" H 3275 1900 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 3288 1850 30  0001 C CNN
F 3 "" H 3250 2000 60  0000 C CNN
	1    3250 2000
	1    0    0    -1  
$EndComp
$Comp
L CTRIM C6
U 1 1 552026F3
P 3250 2400
F 0 "C6" H 3400 2500 50  0000 C CNN
F 1 "6-50p" H 3400 2300 50  0000 C CNN
F 2 "SDRlib:CT-6-50p" H 3250 2400 60  0001 C CNN
F 3 "" H 3250 2400 60  0000 C CNN
	1    3250 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 1600 3250 1850
Wire Wire Line
	3250 2250 3250 2150
Wire Wire Line
	3250 2550 3250 2800
Wire Wire Line
	3250 2800 3850 2800
Wire Wire Line
	3850 2800 3850 2750
Wire Wire Line
	3250 1600 3850 1600
Wire Wire Line
	3850 1600 3850 1650
Wire Wire Line
	4300 1850 4050 1850
Wire Wire Line
	4050 1850 4050 1900
Wire Wire Line
	1850 1850 1850 1900
$Comp
L C C4
U 1 1 5520523D
P 2950 1500
F 0 "C4" V 3000 1550 50  0000 L CNN
F 1 "4p7" V 3000 1300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 2988 1350 30  0001 C CNN
F 3 "" H 2950 1500 60  0000 C CNN
	1    2950 1500
	0    1    1    0   
$EndComp
Wire Wire Line
	3100 1500 3550 1500
Wire Wire Line
	3550 1500 3550 1600
Connection ~ 3550 1600
Wire Wire Line
	2800 1500 2350 1500
Wire Wire Line
	2350 1500 2350 1600
Connection ~ 2350 1600
$Comp
L GND #PWR013
U 1 1 55206303
P 4050 2900
F 0 "#PWR013" H 4050 2650 60  0001 C CNN
F 1 "GND" H 4050 2750 60  0000 C CNN
F 2 "" H 4050 2900 60  0000 C CNN
F 3 "" H 4050 2900 60  0000 C CNN
	1    4050 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 2500 4050 2900
$Comp
L GND #PWR014
U 1 1 552064F2
P 1850 2900
F 0 "#PWR014" H 1850 2650 60  0001 C CNN
F 1 "GND" H 1850 2750 60  0000 C CNN
F 2 "" H 1850 2900 60  0000 C CNN
F 3 "" H 1850 2900 60  0000 C CNN
	1    1850 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 2500 1850 2900
$Comp
L GND #PWR015
U 1 1 552067F5
P 2350 2900
F 0 "#PWR015" H 2350 2650 60  0001 C CNN
F 1 "GND" H 2350 2750 60  0000 C CNN
F 2 "" H 2350 2900 60  0000 C CNN
F 3 "" H 2350 2900 60  0000 C CNN
	1    2350 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2900 2350 2800
Connection ~ 2350 2800
$Comp
L GND #PWR016
U 1 1 552068A2
P 3550 2900
F 0 "#PWR016" H 3550 2650 60  0001 C CNN
F 1 "GND" H 3550 2750 60  0000 C CNN
F 2 "" H 3550 2900 60  0000 C CNN
F 3 "" H 3550 2900 60  0000 C CNN
	1    3550 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 2900 3550 2800
Connection ~ 3550 2800
$Comp
L TRXTOY T1
U 1 1 55208F00
P 1950 2200
F 0 "T1" H 1500 2050 60  0000 C CNN
F 1 "TRXTOY" H 2350 2050 60  0000 C CNN
F 2 "Choke_Toroid_ThroughHole:Transformer_Toroid_horizontal_Diameter12-5mm_Amidon-T44" H 2100 2100 60  0001 C CNN
F 3 "" H 2100 2100 60  0000 C CNN
	1    1950 2200
	0    -1   1    0   
$EndComp
$Comp
L TRXTOY T2
U 1 1 552090AB
P 3950 2200
F 0 "T2" H 3500 2050 60  0000 C CNN
F 1 "TRXTOY" H 4350 2050 60  0000 C CNN
F 2 "Choke_Toroid_ThroughHole:Transformer_Toroid_horizontal_Diameter12-5mm_Amidon-T44" H 4100 2100 60  0001 C CNN
F 3 "" H 4100 2100 60  0000 C CNN
	1    3950 2200
	0    1    1    0   
$EndComp
$Comp
L TR11 T3
U 1 1 55209190
P 6150 2000
F 0 "T3" H 5900 1850 60  0000 C CNN
F 1 "TR11" H 6350 1850 60  0000 C CNN
F 2 "Choke_Toroid_ThroughHole:Transformer_Toroid_horizontal_Diameter12-5mm_Amidon-T44" H 6100 1900 60  0001 C CNN
F 3 "" H 6100 1900 60  0000 C CNN
	1    6150 2000
	0    1    1    0   
$EndComp
Wire Wire Line
	1550 1850 1850 1850
Wire Wire Line
	1400 2050 1400 2900
Wire Wire Line
	2450 4100 2450 4200
Wire Wire Line
	2200 4000 2450 4000
Wire Wire Line
	2450 4000 2450 3950
Wire Wire Line
	1600 4000 1550 4000
Wire Wire Line
	1550 4000 1550 3950
$Comp
L BNC P1
U 1 1 55207277
P 1400 1850
F 0 "P1" H 1410 1970 50  0000 C CNN
F 1 "ANT" V 1510 1790 50  0000 C CNN
F 2 "Sockets_BNC:BNC_Socket_TYCO-AMP_LargePads" H 1400 1850 60  0001 C CNN
F 3 "" H 1400 1850 60  0000 C CNN
	1    1400 1850
	-1   0    0    -1  
$EndComp
$Comp
L CP C1
U 1 1 552AF5AE
P 2450 4350
F 0 "C1" H 2475 4450 50  0000 L CNN
F 1 "10u/50V" H 2475 4250 50  0000 L CNN
F 2 "" H 2488 4200 30  0000 C CNN
F 3 "" H 2450 4350 60  0000 C CNN
	1    2450 4350
	1    0    0    -1  
$EndComp
$EndSCHEMATC
