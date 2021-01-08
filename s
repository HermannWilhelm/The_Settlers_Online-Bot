#!/bin/bash
#################### Notizen:
# Eisenwaffenschmiede von 3 auf 4 Upgraden spart ca. 150 Gold an Picknickkörben für 50k Eisenschwerter
# Mehrwert einer Plakette gegenüber einem Korb: (bzw. Korb gegenüber nichts)
# Goldturm		29
# 4-Eisenwaffenschmiede	46
# 5-Kloster		22
# 5-Schnell-Kupfermiene	88

# Plakette: (LB+Mar+GE )5+20+25=50
# Festmahl: (Fisch, Brot, Würste)   1.5 + 2.5 + 10 = 14
# 2700 Wurst = 54 Betriebe fördern
# 16800 Brot = 168 Betriebe fördern
# Händler: gerdenion


# Funktionen
if true ; then

# Variablen
if true ; then
# Veränderliche Valiablen:
fischNum=3				#auf welches Vorkommen soll fischfutter angewendet werden? (1,2,3,4, von links gezählt)
fleischNum=2				#similar (1,2)
#Für s_starpos -r:
rohstoffStarposFarben=(			#auskommentieren, wenn der Rohstoff nicht angewendet werden soll
'70675b' #Armbrüste
'ce2900' #Balons
##'a49d8f' #Bögen - alt
#'330b02' #Bögen
'edcd6e' #Bronzekessel
#'d45c45' #Bronzeschwerter
#'e8d0a5' #Brote
'afadb5' #Damaszenerschwerter
'573f23' #Edelholz
#'bda781' #Einfaches Papier
#'603b3b' #Eisenerz
'ad9f8c' #Eisenschwerter
'5fa8cf' #Fische + Fischfutter
'a45a37' #Fleisch
'861952' #Geschenke
#'4f2c08' #Getreide
#'cc8604' #Golderz
'543d2e' #Granit
'dd8b0c' #Kartenfragmente
#'9da4a0' #Kohle
'a12c0c' #Kopendien
#'f87a51' #Kupfererz
'ee9c14' #Kürbisse
'98866e' #Langbögen
#'a47c34' #Laubholz
'a47c34' #Laubholzbretter
'8b5a1b' #Malzbier
#'ab977b' #Marmor
#Moschus siehe Fleisch
'd4a620' #Münzen
##'643a24' #Nadelholz - alt
#'692f0c' #Nadelholz
'402c13' #Pferde
'f84444' #Rote Nasen
'030101' #Schreibfedern
#'e6b57c' #Siedler
'fbfaf2' #Salpeter
'd7cbc5' #Salpeter
'cdd9ed' #Stahl
'9eacc2' #Stahlschwerter
#'403d39' #Steine
'ffffff' #Titanerz
'e4c697' #verbessertes Papier
'87552a' #Werkzeuge
#'97411f' #Würste
'67822a' #Zauberbohnen
)

RohstoffPos=(\
"367_600 391_588 707_405 754_407 788_381 941_277 1011_247 1105_263 1175_190 1210_182 1386_521 1431_578 1468_571 1502_549 1432_765 1491_744 1560_700" \
"468_725 447_742" \
"371_833 409_798 946_535 980_526 914_269 969_262 1037_218 1242_242 1229_304 1466_753 1533_723")

goldturm=930_658

#foerderRohstoffe=( Marmor Kupfer Bronze Werkzeug Malzbier Brot Bronzeschwert Bogen Schreibfeder Wurst Pferd Langbogen VPapier Eisen Stahl Stahlschwert Edelholzbrett )
 foerderRohstoffe=( Marmor Kupfer Bronze Werkzeug Malzbier Brot Bronzeschwert Bogen Schreibfeder Wurst Pferd Langbogen VPapier Eisen Stahl Stahlschwert               )
#foerderRohstoffe=( Marmor Kupfer Bronze Werkzeug Malzbier Brot Bronzeschwert Bogen Schreibfeder Wurst Pferd Langbogen VPapier                                        )
#foerderRohstoffe=( Eisen Stahl Eisenschwert Stahlschwert )

#startstoppRohstoffe=( Eisen )
#startstoppRohstoffe=( Stahl )
#startstoppRohstoffe=( Eisen Stahl Stahlschwert )
startstoppRohstoffe=( Eisen Stahl Stahlschwert Edelholzbrett )

gebaeude=( \
EINFACH Nadelholz_1 512_406 544_416 545_475 474_431 Nadelbrett_2 500_748 Stein_3 473_763 Fisch_4 650_945 624_932 601_945 579_958 \
545_968 556_944 521_951 529_929 497_939 440_945 482_916 508_901 495_867 462_858 486_844 520_849 VERBESSERT Kohle_0 \
801_473 849_443 1479_402 697_883 659_818 613_848 602_885 554_915 568_762 624_684 920_315 1551_559 1581_552 \
1644_503 532_252 533_222 463_237 Kupfer_1 1012_895 966_920 522_605 Bronze_2 548_891 570_878 1097_741 1097_769 861_784 862_811 \
Werkzeug_3 989_574 963_616 930_626 1060_335 Wasser_4 794_448 1531_367 1541_393 523_515 901_571 618_728 891_763 944_760 955_783 890_796 \
Getreide_5 1433_919 1458_934 1481_951 1515_247 1540_264 1563_277 1155_602 1178_617 1199_631 836_680 898_701 848_702 765_725 802_734 \
778_747 825_746 800_759 835_769 857_754 884_740 Malzbier_6 546_443 Mehl_7 722_912 664_873 630_867 547_889 572_846 594_831 535_750 \
675_930 688_701 713_686 Brot_8 1025_783 1071_755 651_912 509_769 Bronzeschwert_9 941_605 581_724 556_737 \
1377_552 1329_551 1306_538 1305_567 1472_377 1494_363 1518_349 1518_406 Bogen_10 471_820 \
EPapier_11 546_773 Schreibfeder_12 438_810 647_640 668_629 GEHOBEN Laubholz_0 860_469 841_484 558_294 513_294 523_489 \
475_461 489_282 Laubbrett_1 788_423 908_542 980_797 910_642 638_806 616_820 652_857 1516_353 1493_368 1469_383 1443_398 1492_429 \
Eisenerz_2 ${RohstoffPos[0]} Eisen_3 547_618 569_604 581_569 591_588 591_922 595_620 608_771 615_605 615_909 630_756 638_893 675_688 \
697_670 1084_287 1095_338 1123_324 1202_359 1225_345 1225_534 1237_494 1238_365 1248_330 1249_515 1250_462 1259_423 1260_479 \
1261_537 1262_380 1271_316 1275_445 1275_445 1282_467 1284_337 1284_365 1284_526 1285_408 1296_490 1306_396 1308_511 1309_452 \
1329_497 1355_452 547_618 569_604 581_569 591_588 591_922 595_620 608_771 615_605 615_909 630_756 638_893 675_688 697_670 \
Stahl_4 498_533 1003_770 1028_757 1050_741 1247_803 1281_810 1294_833 1271_851 1238_842 1213_828 638_235 661_221 697_227 685_264 651_257 1062_300 \
930_382 909_368 944_345 979_352 1001_337 992_375 \
Muenzen_7 $goldturm Marmor_8 907_292 1035_256 1047_281 1024_279 927_553 952_566 977_553 1549_748 1492_769 Fleisch_9 \
1074_785 1050_797 1435_793 1398_799 1377_811 1353_827 1365_852 1396_857 1341_870 603_668 625_652 Wurst_10 556_911 697_883 615_847 \
662_817 565_761 Pferd_11 497_807 521_792 Eisenschwert_12 1481_616 1457_631 1423_624 1401_610 1424_594 1458_586 \
Stahlschwert_13 966_586 802_199 827_214 850_226 825_242 801_256 779_241 754_226 778_211 978_307 955_321 \
723_291 696_278 720_263 744_249 769_263 \
Langbogen_14 987_602 VPapier_15 1049_887 Satzschmied_16 987_633 LUXUS Edelholzbrett_1 1441_239 1467_254 1514_225 1489_208 )



#Förderungen: (bei s_starpos -r)
c_festmahl='533f24'
c_stoppen='c54b3e'
picknick='939f56'
fischteller='f0dcc1'

#Colorcodes at s_starpos
#Color normal 	Color busy	  Name
export  cvn='e7f5fc'  cvb='d9bf8b'	# Veteran
export  cmn='d8db00'  cmb='bca578'	# Meister der Kampfkunst
export ckgn='ffffff' ckgb='d9c791'	# Kampfgestählter General
export cgen='fff9fc' cgeb='d9c48f'	# General
export ceen='b1383c' ceeb='89825a'	# Erfahrener Entdecker
export cwkn='9b7333' cwkb='a49a6b'	# Wilder Kundschafter
export cwkb2='7e6f51'
export cgreene='75903c' cgreeneb='887857'	# Erfolgreicher Entdecker
export  cen='594b3f'  ceb='867f57'	# Entdecker
export cfgn='b37013' cfgb='a59a6b'	# Fröhlicher Geologe
export  cgn='6e391d'  cgb='7e7852'	# Geologe
export   cempty='40382b'
export cemptyr='433a2b'

export     sumpf='626363'
export verraeter='5d4a31'
export     insel='6f6051'
export    sattel='a4a39c'
export    tropen='c8daea'
export   raeuber='342a15'
export    beutel='453f24'
export     ueber='544b2e'
export  priester='35322b'
export  schaedel='617458'
export    ritter='24262b'
export      nord='62523a' #625237

case $fischNum in
1)	fischkoord='437 888' ;;
2)	fischkoord='462 976' ;;
3)	fischkoord='602 972' ;;
4)	fischkoord='647 975' ;;
esac

[[ $fleischNum -eq 1 ]] && fleischkoord="1081 808"
[[ $fleischNum -eq 2 ]] && fleischkoord="1421 831"

fi

shopt -s extglob
atabbrechen () { left 1835 526 0.5 ; left 1834 620 0.5 ; left 956 657 5 ; left 997 650 5 ; } 		#bricht das aktuelle Abenteuer ab
Questbuch ()  { left 190 264 1 ; }					#Questbuch
Belohnung () { left 1068 819 1 ; }					#Questbuch -> Belohnung annehmen

nachhause () {
#nach einem fertigen abenteuer: "Belohnung", "zurück nach hause"
#Wenn nach dem Abenteuer noch ein weiteres Abenteuer kommt (-n $zwei) , sende alle Truppen mit zurück
sende=0
#if [[ -n $zwei && $zwei != h && $# -ne 0 ]] ; then
if true ; then
  unset glist
  sende=1
  while [[ $# -gt 0 ]] ; do
    [[ $# -eq 1 ]] && leave "nachhause: Even number of arguments expected"
    glist="$glist $1 $[($2+5)/6]"
    shift 2
  done
  for i in 1 2 3 4 5 6 ; do
    s_units $i $glist
  done
fi
Questbuch
Belohnung
sleep 30
Belohnung
sleep 30
left 992 821 1		#zurück nach hause
sleep 30
if ((sende)) ; then
  pause 25
  for i in 1 2 3 4 5 6 ; do
    s_units -n $i $glist
  done
fi
}

zurueck () { left 847 697 0.5 ; }						#General angewählt -> general zurückziehen
Geologe () { left $(s_starpos $1) 0.4 ; left $2 $3 0.4 ; left 956 784 0.2 ; }	#Geologe, (starpos des Geologen) (koords des Rohstoff als x_y )
Poweroff () { sleep 1 ; left 13 15 1 ; pow ; }					#Firefox schießen und Computer runterfahren
leave () { 
  if [[ $poweroffQ -eq 1 ]] ; then
    echo $1 >> ~/.s_bug_report
    Poweroff
  else
    echo $1
  fi
  exit 1
}
#---------------------------------------------------------------------------------------------Options--------------------------------------------------------------------------------------------------

wait_daily_loginQ=1
built_minesQ=1
stopp_forderQ=0
send_geologists_anywayQ=0
demolish_minesQ=0
print_options=0
print_arguments=0
print_lists=0
wait_until_buffs_overQ=0
while [[ ${1:0:1} = '-' ]] ; do
  if [[ ${1:1:1} = '-' ]] ; then
    case ${1:2} in
      wait_login)	wait_daily_loginQ=0		;;
      poweroff)		poweroffQ=1			;;
      dont_built_mines)	built_minesQ=0			;;
      send_anyway)	send_geologists_anywayQ=1	;;
      stopp_foerder)	stopp_forderQ=1			;;
      stopp_förder)	stopp_forderQ=1			;;
      wait_until_buffs_over) wait_until_buffs_overQ=1	;;
      demolish_mines)	demolish_minesQ=1		;;
      options) 		print_options=1  		;;
      arguments)	print_arguments=1 		;;
      lists)		print_lists=1			;;
      startstoppRohstoffe=*)	eval "${1#--}"		;;
      foerderRohstoffe=*)	eval "${1#--}"		;;
      *)	echo "s: unknown option $i" ; exit 1	;;
    esac
  else
    for i in $(echo ${1/-/} | sed 's/ */ /g') ; do
      case $i in 
	w)        wait_daily_loginQ=0		;;	#Warte nicht auf den Dayli-Login-Bonus
	p)        poweroffQ=1			;;	#Schalte den Computer nach dem Programm aus
	m)        built_minesQ=0		;;	#Für h: Baue keine Mienen
	d)	  demolish_minesQ=1		;;	#Für h: Reiße vorhandene Mienen ab
	s)        send_geologists_anywayQ=1	;;	#Für h: Schicke Geologen los, auch wenn gerade Geologen suchen
	f)	  wait_until_buffs_overQ=1	;;	#Für h: Warte bis Buffs vorbei sind
	S)        stopp_forderQ=1		;;	#Für h: Stoppe die aktiven Förderungen und fördere neu
	o)	  print_options=1		;;
	a)	  print_arguments=1		;;
	l)	  print_lists=1			;;
	*)        echo "s: unknown option $i" ; exit 1  ;;
      esac
    done
  fi
  shift
done

# Fehler ausgeben, wenn foerderRohstoffe oder startstoppRohstoffe falsch sind.
for i in ${foerderRohstoffe[*]} ${startstoppRohstoffe[*]} ; do
  if ! echo ${gebaeude[*]} | sed 's/\([0-9]\|_\|\( \|^\)[A-Z]*\( \|$\)\)//g' | grep -q "\( \|^\)$i\( \|$\)" ; then
    echo "s: $i ist kein von mir benutzter Rohstoffname." && exit 1
  fi
done

(($print_options)) && echo -e 'Options:
--wait_login (w)\n--poweroff (p)\n--dont_built_mines (m)\n--demolish_mines (d)
--send_anyway (s) [schicke Geologen auch los, wenn welche am Suchen sind]
--stopp_förder (S)
--wait_until_buffs_over (f)
--startstoppRohstoffe=( [Rohstoffe] ) [Falls nicht angegeben wird der Standartwert genutzt]
--foerderRohstoffe=( [Rohstoffe] )  [Falls nicht angegeben wird der Standartwert genutzt]
Hilfs-Argumente: [Bei Angabe wird das Programm nicht gestartet]
--options (o)
--arguments (a)
--lists (l) [gibt die Werte für $startstoppRohstoffe und $foerderRohstoffe aus]'
(($print_arguments)) && echo -e "
Arguments:
h    - macht alles, was täglich gemacht werden muss
star - wendet die Rohstoffe und Rohstoffauffüller im Sternmenü auf die entsprechenden Ziele an
nord, priester, sattel, sumpf, tropen, schaedel - spielt das entsprechende Abenteuer
startstopp - startet / stoppt die Produktion aller Rohstoff aus startstoppRohstoffe
eisen, stahl, stahlschwert - verkauft eisen, stahl bzw stahlschwerter"
(($print_lists)) && echo -e "foerderRohstoffe:\n${foerderRohstoffe[*]}\nstartstoppRohstoffe:\n${startstoppRohstoffe[*]}"
(($print_options+$print_arguments+$print_lists)) && exit 0



# Fehler ausgeben und abbrechen, falls die Argumente falsch sind.
[[ $# -eq 0 ]] && echo "s: No argument given. Type s -ao for list of arguments and options." && exit 1
for i in $* ; do
 [[ ! $i =~ ^(h|test|star|startstopp|nord|priester|sattel|sumpf|tropen|schaedel|schädel|nordend|eisen|stahl|stahlschwert|kohle)$ ]] && echo "s: unknown argument '$i'." && exit 1
done

# Fehler ausgeben, wenn in $gebaeude was falsch ist.
for i in ${gebaeude[*]} ; do
  [[ ! $i =~ ^([0-9]{1,4}_[0-9]{1,4}|([a-z]|[A-Z])*_[0-9]{1,2}|[A-Z]*)$ ]] && echo "s: gebaeude bei $i falsch." && exit 1
done

((wait_until_buffs_overQ*stopp_forderQ)) && echo "s: Bis zur Ende der Förderung warten (f) und sie dann stoppen (S) macht keinen Sinn." && exit 1

#-----------------------------------------------------------------------------------Program starts here------------------------------------------------------------------------------------------------
if [[ $1 != 'test' ]] ; then
if true ; then #top -bn1 | grep -q firefox ; then
  left 30 170 0.3						#Firefox öffnen
  left 500 500 0.5						#Fenster aktivieren
  left 354 6 0.5						#Tools anklicken, damit sich das Firefoxfenster nach unter schiebt.
  left 500 500 0.5						#Fenster wieder aktivieren
  left 500 500 0.5
else
  firefox "http://www.diesiedleronline.de/de/startseite" &	#firefox öffnen
  left 1218 133 5						#Login
  left 643 616 1						#Jetzt spielen
  waitforcolor -m 15 1100 425 'e1bc71'
  [[ $? -ne 0 ]] && leave "siedler: 'Tipp des Tages' did not appear"
  left 995 760 1						#"Tipp des Tages" wegklicken
  #waitforcolor -m 15 1406 374 'b26725'
  #[[ $? -ne 0 ]] && leave "siedler: 'Questbuch' did not appear"
  #left 1406 374 1						#"Questbuch" wegklicken
  if [[ $wait_daily_loginQ -eq 1 ]] ; then
    waitforcolor -m 60 1100 725 '8c7c5b'
    [[ $? -eq 1 ]] && leave "Daily-Login-Bonus did not appear"
    left 995 734 1						#Daily-Login wegklicken
    left 1341 381 1						#"Neu im Shop" wegklicken
  else
    sleep 20
  fi
fi
fi

fi

while [[ $# -gt 0 ]] ; do
c=0
case $1 in

eisen)
s_handel 10000 'eisen' 5900 'nzen' 4
echo $2
[[ $2 =~ (eisen|stahl|kohle) ]] && sleep 20
;;
stahl)
s_handel 10000 'stahl' 7900 'nzen' 4
[[ $2 =~ (eisen|stahl|kohle) ]] && sleep 20
;;
stahlschwert)
s_handel 10000 'stahlsch' 11400 'nzen' 4
[[ $2 =~ (eisen|stahl|kohle) ]] && sleep 20
;;
kohle)
s_handel 100 'nzen' 10000 'kohle' 4
sleep 20
s_handel 500 'nzen' 50000 'kohle' 4
sleep 20
s_handel 200 'nzen' 20000 'kohle' 4
[[ $2 =~ (eisen|stahl|kohle) ]] && sleep 20
;;
h)


# Karte auf die richtige Position schieben
s_adjust_map
# ----------------------------------------------------------------Marmor, Stein und Eisen (bricht bekanntlich, und muss daher neu aufgebaut werden) -----------------------------------------------------
# Falls irgendein Geologe noch am Suchen ist, setze send_geologistsQ auf 0. Ansonsten finde die Position des ersten und letzten Geologen und schicke Entdecker auf Suche.
firstGeoPos=0
lastGeoPos=0
send_geologistsQ=1
s_star Spezialisten
# Für alle StarPositionen, (Falls i=18 wird das Sternmenü eine Zeilen nach unten geschoben und wieder die letzte Zeile durchgegangen, da s_starpos 24 = s_starpos 18)
artefakt=0
c=1
while true ; do
  for i in $(seq $((6*c-5)) $((6*c))) ; do
    col=$(color $(s_starpos $i))
    [[ $col =~ ($cwkb|$cwkb2) ]] && artefakt=0
    if [[ $col =~ ($cen|$ceen|$cwkn|$cgreene) ]] ; then
      left $(s_starpos $i) 0.3	#entdecker
      if ((artefakt)) ; then
	left 965 655 0.2		#schatz suchen
	left 961 681 0.2		#Artefaktsuche
	left 955 792 0.3		#Ok nach Schatzsuche
	artefakt=0
      else
	left 965 655 0.2		#schatz suchen
	left 1134 618 0.2		#sehr lange schatzsuche
	left 954 814 0.3		#Ok nach Schatzsuche
	#left 1130 615 0.2		#abenteuer
	#left 965 615 0.2		#kurze abenteuersuche
	#left 1130 615 0.2		#mittlere abenteuersuche
	#left 965 655 0.2		#lange abenteuersuche
	#left 959 765 0.3		#Ok nach abenteuersuche
      fi
      s_star
    fi
    [[ $firstGeoPos -eq 0 ]] && [[ $col =~ ($cfgn|$cgn) ]] && firstGeoPos=$i
    [[ $col =~ ($cfgb|$cgb) && $send_geologists_anywayQ -eq 0 ]] && send_geologistsQ=0 && break 2
    [[ $col = $cempty ]] && lastGeoPos=$((i-1)) && break 2 # Ein Feld vor dem ersten leeren ist der letzte Geologe
    [[ $((i%6)) -eq 0 && $i -ge 18 ]] && s_star_down
  done
  let c++
done
s_starX

#Für Mienenbau am Ende:
ironmines_downQ=0
ironfield_thereQ=0

##########################
send_geologistsQ=0 #######
##########################

if [[ $send_geologistsQ -eq 1 ]] ; then
#Reihenfolge: Eisen, Stein, Marmor
GeologeRohstoffPos=( 1133_638 962_593 962_635 )
RohstoffVerbraucht=( -1 0 -1 )


unset abreislist
# Schauen, welche Mienen eingestürtzt sind.
for i in 0 1 2 ; do
  for j in $(echo ${RohstoffPos[i]}) ; do
    left $j 0.5					#Miene anklicken
    if [[ $(color 1794 840) = 'c38341' ]] ; then	#Falls da die Farbe des "X" der verbrauchten Miene ist
      let RohstoffVerbraucht[i]++
      left 1794 841 0.2				#Miene schließen
    elif [[ $i -eq 0 ]] ; then
      if [[ $(color 1794 618) = 'c38341' ]] ; then	#Falls da die Farbe des "X" der arbeitenden Miene ist
        if ((demolish_minesQ)) ; then
	  let RohstoffVerbraucht[0]++
	  abreislist="$abreislist $j"
	fi
	left 1794 618 0.2			#Miene schließen
      else
	ironfield_thereQ=1
      fi
    fi
  done
done

if ((demolish_minesQ)) ; then
  left 708 1029 1		#Gebäude
  left 844_954 0.5		#Werkeugkasten
  left 710_895 0.5		#Gebäude abreißen
  for i in ${abreislist[*]} ; do
    left $i 0.2
    left 951_684 0.2		#Wirklich abreßen? Ja
  done
  [[ -n $abreislist ]] && sleep 15
fi


[[ ${RohstoffVerbraucht[0]} -ne 0 ]] && ironmines_downQ=1

# Geologen losschicken
while true ; do
  [[ $(echo ${RohstoffVerbraucht[*]} | sed 's/ /+/g' | bc) -eq 0 ]] && break
  s_star Spezialisten
  for i in $(seq 20 6 $firstGeoPos) ; do s_star_down
  done
  for i in $(seq $firstGeoPos $lastGeoPos) ; do
    [[ $((i%6)) -eq 1 && $i -ge 18 ]] && s_star_down
    if [[ $(color $(s_starpos $i)) =~ ($cfgn|$cgn) ]] ; then			# Falls auf dem Feld ein unbeschäftigter Geologe ist
      for j in 0 1 2 ; do
	if [[ ${RohstoffVerbraucht[j]} -gt 0 ]] ; then				#Falls von diesem Rohstoff nochwas gesucht werden muss
	  Geologe $i ${GeologeRohstoffPos[j]}					#Schicke den Geologen los diesen Rohstoff suchen
	  let RohstoffVerbraucht[j]--						#und sage, dass von diesem Rohstoff nur noch eins weniger gesucht werden muss
	  break									#Gehe zum nächsten Feld
	fi
      done
      [[ $(echo ${RohstoffVerbraucht[*]} | sed 's/ /+/g' | bc) -eq 0 ]] && break 2	#Wenn nichts mehr gesucht werden muss, breche ab.
      [[ $i -ne $lastGeoPos ]] && s_star					#Falls ein Geologe suchen geschickt wurde, und die letzte Position noch nicht erreicht ist, öffne wieder das Sternmenü
    else
      [[ $i -eq $lastGeoPos ]] && s_starX					#Falls kein Geologe suchen geschickt wurde (also das Sternmenü noch offen ist), die letzte Position aber erreicht ist, schließe das Sternmenü
    fi
  done
  sleep 60
done

else
#Wenn keine Geologen geschickt werden sollen, schaut das Programm am Ende auf jeden Fall nach den Mienen:
ironfield_thereQ=1
ironmines_downQ=1
fi

s_programm_nachrichten_annehmen

#s_programm_angebote_einstellen

s_programm_buch_binden


#########
exit 0
#########

#------------------------------------------------------------------------------ Eisenmienen bauen -------------------------------------------------------------------
# schaue an jeder Eisenstelle, ob da eine Miene steht. Falls nicht, baue da eine Eisenmiene hin.
# Bei einem leeren unentdeckten Feld versucht das Program da eine Miene hinzubauen (Die sind schwer von entdeckten Feldern zu unterscheiden und kommen nicht vor, wenn das Program benutzt wird).
# (Das Programm schaut ein zweites mal wo Mienen stehen, weil Mienen einstürzen können in der Zeit, wo die Geologen suchen)

#Gehe zwei mal durch: Beim ersten mal nur wenn am Anfang entdeckte Felder vorhanden waren und keine Mienen abgerissen wurden.
# Beim zweiten mal nur wenn am Anfang eingestürtze Mienen vorhanden waren. In diesem Fall warte auf die suchenden Geologen.
unset ausbaulist
if ((built_minesQ)) ; then
for i in 1 2 ; do
  [[ $i -eq 1 && $(($ironfield_thereQ+$demolish_minesQ)) -eq 0 ]] && continue
  if [[ $i -eq 2 ]] ; then
    ((ironmines_downQ)) || break
    while true ; do
      s_star Spezialisten
      s_star_search_for $cfgb
      [[ $? -eq 1 ]] && break
      sleep 60
    done
  fi
  #für alle Mienenpositionen
  for pos in $(echo ${RohstoffPos[0]} ) ; do
    left $pos 0.5                         #Miene anklicken
    col=$(color 1794 841)
    if [[ $col = 'c38341' ]] ; then     #Falls da die Farbe des "X" der verbrauchten Miene ist
      left 1794 841 0.2                 #Miene schließenmezzo pianoTschaikowski
    elif [[ $col =~ 3[e-f]5[5-a]6[9-f] ]] ; then    #Wenn an dieser Stelle Meer ist, baue eine Miene
      sleep 20
      waitforcolor -o 1875 340 '6[b-e]5[4-6]3[5-7]' #wait_for_free_building_space
      left 708 1029 1                   #Gebäude
      left 716 954 1			#Gehobene Gebäude
      left 711 716 1                    #Eisenmiene im Sternmenü
      left $pos 1
      ausbaulist="$ausbaulist $pos"
    else                                #Sonst schließe die arbeitende bzw bauende Miene
      left 1794 741 0.2
      left 1794 619 0.2
    fi
  done
  # Falls nicht auf die Geologen gewartet werden soll oder schon das zweite mal die Mienen durchgegangen wurde, kann an dieser Stelle abgebrochen werden.
done
s_starX
fi

#  ----------------------------------------------------Mienen ausbauen----------------------------------------------------------
if [[ -n $ausbaulist ]] ; then
  waitforcolor -o 1875 155 '6[b-e]5[4-6]3[5-7]' #wait until building queue is empty
  sleep 5
  for pos in $ausbaulist ; do
    left $pos 0.5
    left 1537 834 0.5
    left 957 659 0.5
  done
  #Mienen auf Sektor 4,5,8 auf Stufe 3 ausbauen
  wait_for_ausbau=1
  for pos in $ausbaulist ; do
    if [[ ${pos%_*} -lt 1300 ]] ; then
      if [[ $wait_for_ausbau -eq 1 ]] ; then wait_for_ausbau=0 ; sleep 150 ; fi
      left $pos 0.5
      left 1537 834 0.5
      left 957 659 0.5
    fi
  done
fi

# ---------------------------------------------------------------------------------------Soll gefördert werden? -------------------------------------------------------------
#wait|stopp|turm	w|s|f		(f: foerderQ, daher =1 am Anfang)
#  0    0    0		0    		
#  0    0    1		0   0 (sonst 1)
#  0    1    0		0    
#  0    1    1		0    
#  1    0    0		0   
#  1    0    1		1     
#  1    1    0		0   
#  1    1    1		1     


turm_gefordertQ=0
foerderQ=1
left $goldturm 0.5
[[ $(color 1763 658) =~ ('dee17f'|'e5e886') ]] && turm_gefordertQ=1


[[ $wait_until_buffs_overQ -eq 0 && $stopp_forderQ -eq 0 && $turm_gefordertQ -eq 1 ]] && foerderQ=0
if [[ $wait_until_buffs_overQ -eq 1 && $turm_gefordertQ -eq 1 ]] ; then
  while true ; do
    [[ $(color 1763 658) =~ ('dee17f'|'e5e886') ]] || break
    left 1793 618 0.5	#Goldturm schließen
    left $goldturm 0.5
  done
fi
left 1793 618 0.5	#Goldturm schließen

# -------------------------------------------------------------------Schauen, welche Rohstoffe aus $gebaeude voll sind.--------------------------------------------------------
#case $pos in
#  1234_1234) falls ff=1: AppendTo [ foerderlist, pos]					[ff : der Aktuelle Rohstoff soll gefördert werden]
#  GROßBUCHSTABEN) wähle die nächste Rohstoffkategorie an (Einfach, gehoben, ...)
#  Rohstoff_## ) Falls Rohstoff in foerderRohstoffe  und der Speicher dieses Rohstoff nicht voll : ff=1, sonst ff=0
#


unset foerderlist
kategorie=0
sl=10
if ((foerderQ+stopp_forderQ)) ; then
  s_select_rathaus
  for pos in ${gebaeude[*]} ; do
    case $pos in 
      +([0-9])_+([0-9]))
	((ff)) && foerderlist="$foerderlist $pos" || let sl+=2 ;;
      +([A-Z]))
	s_select_rathaus_rohstoff $((++kategorie)) ;;
      *)
	if echo ${foerderRohstoffe[*]} | grep -q "\( \|^\)${pos%_*}\( \|$\)" && [[ $(color $((1472+${pos#*_}%4*80)) $((703+${pos#*_}/4*40)) ) = '443826' ]] ; then
	  ff=1
	else
	  ff=0
	fi
      ;;
    esac
  done
fi

((wait_until_buffs_overQ)) && sleep $sl

#Förderung stoppen

star_forderQ=1
if ((stopp_forderQ)) ; then
  for pos in $goldturm $foerderlist ; do
    [[ ${pos%_*} -lt 521 && ${pos#*_} -lt 640 ]] && sleep 15
    move 993 960
    sleep 0.5
    if [[ ! $(color 993 960) =~ ('3e231d'|'351914') ]] ; then
      if ((star_forderQ)) ; then s_star förder ; star_forderQ=0 ; else s_star ; fi
      s_star_search_for -r $c_stoppen
      [[ $? -ne 0 ]] && leave "s: 'Förderung stoppen' alle"
    fi
    left $pos 1
  done
  [[ $(color 993 960) =~ ('3e231d'|'351914') ]] && left 993 960 0.5
fi

# Gebäude fördern

star_forderQ=1
for pos in $( if ((foerderQ)) ; then echo $goldturm $foerderlist ; fi ) $ausbaulist ; do
  [[ ${pos%_*} -lt 506 && ${pos#*_} -lt 506 ]] && sleep 15
  move 993 960
  sleep 0.5
  if [[ ! $(color 993 960) =~ ('3e231d'|'351914') ]] ; then
    if ((star_forderQ)) ; then s_star förder ; star_forderQ=0 ; else s_star ; fi
    s_star_search_for -r $c_festmahl
    [[ $? -ne 0 ]] && leave "s: Irmas alle"
  fi
  left $pos 1
done
[[ $(color 993 960) =~ ('3e231d'|'351914') ]] && left 993 960 0.5

echo $sl

;;

startstopp)
s_adjust_map
unset startstopplist
for pos in ${gebaeude[*]} ; do
  case $pos in 
    +([0-9])_+([0-9]))
      ((ff)) && startstopplist="$startstopplist $pos" ;;
    *)
      if echo ${startstoppRohstoffe[*]} | grep -q "\( \|^\)${pos%_*}\( \|$\)" ; then
	ff=1
      else
	ff=0
      fi
    ;;
  esac
done
for i in ${startstopplist[*]} ; do
  left $i 0.2
  left 1730 832 0.2
done
;;

star)
#---------------------------------------------------------------------Sternmenü-Rohstoffe anwenden-----------------------------------------------------------------------
c=3
s_adjust_map
s_star Rohstoffe
s_star_all_down
while true ; do
  #wendet die $c-te Zeile an
  for i in $(seq $((6*c)) -1 $((6*c-5))) ; do
    col=$(color $(s_starpos -r $i))
    if echo ${rohstoffStarposFarben[*]} | grep -q $col ; then
      #Setze die Koordinaten auf das Rathaus, außer bei speziellen Rohstoffen
      case $col in 
	'5fa8cf') [[ $(color $(s_starpos -v $i)) =~ (663811|76674e) ]] && CoordsForItem=$fischkoord ;;	#Fische
	'cc8604') [[ $(color $(s_starpos -v $i)) = '663811' ]] && CoordsForItem="1455 204" ;;	#Golderz
	'603b3b') [[ $(color $(s_starpos -v $i)) = '663811' ]] && CoordsForItem="1112 246" ;;	#Eisenerz
	'4f2c08') [[ $(color $(s_starpos -v $i)) = '663811' ]] && CoordsForItem="1538 223" ;;	#Getreide
	'ab977b') [[ $(color $(s_starpos -v $i)) = '663811' ]] && CoordsForItem="996 967"  ;;	#Marmor
	'a45a37') CoordsForItem=$fleischkoord ;;	#Moschus
	*) CoordsForItem="548 800" ;;
      esac
      left $(s_starpos $i) 0.7
      left $CoordsForItem 0.7
      s_star
      sleep 1
    fi
  done
  # falls der Balken sich nicht mehr nach oben schieben lässt: Wende noch die 2-te und 1-te Zeile an, dann break
  if [[ $c -eq 3 ]] ; then
    if [[ $(color 1157 761) =~ 3[ab]3[67]29 ]] ; then
      s_star_up
    else
      let c--
    fi
  else
    [[ $c -eq 1 ]] && break
    let c--
  fi
done
s_starX
;;

nord)
  s_abenteuer_starten nord
  [[ $? -ne 0 ]] && exit 1
  s_select_general 2
  s_map_right_up
  s_gen_move 1484 372
  s_select_general 1
  s_map_right_up
  s_gen_move 1531 388
  s_units 2 a 154 c 66
  s_gen_attack 992 454		#Erste beiden Lager -------------------
  s_units 2 a -154 c -66
  s_units 1 r 1 e 1 a 248
  s_gen_attack 887 288		#Angriff auf das vierte Lager
  sleep 140 			#Der Veteran wird dann vom 3. Lager abgefangen
  s_select_general -w 1
  zurueck			#Zurückziehen, damit er nicht das 4. Lager angreift
  s_units 1 r -1 e -1 a -248
  s_units 2 c 10 a 210
  s_gen_attack 934 228		#Erstes Hauptlager, Ablenkung zum 4. Lager
  s_units 2 c -10 a -210
  s_select_general 1
  s_gen_move 944 209
  s_select_general 2
  s_gen_move 1037 236
  s_units 1 a 250
  s_gen_attack 1203 626
  s_units 1 a -250
  s_units 2 a 210 c 10
  s_gen_attack 1165 762
  s_units 2 c -10 a -6 e 1 m 15
  s_gen_attack 1214 790		#2. Hauptlager
  sleep 100
  s_units 1 c 150
  s_gen_attack 1472 978
  s_select_general 2
  s_gen_move 1317 737
  s_units 2 e -1 m -15 a 6 c 10
  s_gen_attack 1132 826		#3. Hauptlager
  s_select_general 1
  s_gen_move 1273 828
  s_units 2 a -210 c -10
  s_select_general 1
  s_gen_move 1296 684
  s_units 1 c -150 m 15 e 1 a 234
  s_gen_attack 1096 402
  s_units 1 a -32 m -15 e -1 m 47 e 1 a 7	# a 202
  s_gen_attack 1074 374				#4. Hauptlager
  s_units 1 a -17 e -1 e 1 s 23 m 41		# a 185
  s_gen_attack 1226 136				#Letztes Hauptlager
  s_units 3 a 75 m 120
  s_units 2 c 160 e 9 r 1
  while true ; do
    Questbuch
    sleep 5
    if [[ $(color 1067 822) != 598e16 ]] ; then
      left 1407 379 1		# Questbuch schließen
      sleep 5
    else
      Belohnung
      break
    fi
  done
  sleep 30
  left 992 821 1		#zurück nach hause
  sleep 780
  s_units 3 a -75 m -120
  s_units 2 c -160 e -9 r -1
  s_units 1 a -185 m -41 s -23 e -1
  s_starX
  ;;
priester)
  s_abenteuer_starten priester r 360 s 200 c 280 b 20 a 120
  [[ $? -ne 0 ]] && exit 1
  s_select_general 1
  s_map_right_up
  verschieb 1240 160 600 520
  s_gen_move 1466 304
  #s_select_general 5
  #s_map_right_up
  #verschieb 1240 160 600 520
  #s_gen_move 1488 319
  s_units 1 s 200 r 50
  s_gen_attack 640 692			#1. Lager Mitte
  s_units 1 r 50
  s_gen_attack 641 640			#Hauptlager Mitte
  s_units 1 s -200 r -50 c 237 r 13
  s_gen_attack 1060 597			#Lager oben
  s_units 1 c -237 s 31 a 120 b 16 r 83
  s_gen_attack 967 468			#Schloss
  #s_select_general 5
  #s_units r 32
  #s_gen_attack 805 467			#optionales Hauptlager
  s_units 1 a -120 s -31 b -16 r -80 c 250
  s_gen_attack 828 482			#optionales Hauptlager
  s_select_general 1
  s_gen_move 441 576
  s_units 1 c 30
  s_gen_attack 954 505			#kirchlager 1
  s_units 1 c -250 r 100 s 150
  s_gen_attack 815 559			#kirchlager 2 & 3
  s_units 1 s -150 r -100 a 90 c 110 r 50
  s_gen_attack 710 583
  s_units 1 a -90 c -110 r -50
  nachhause a 120 c 280 b 10 r 140 s 200
;;
sattel)
  s_abenteuer_starten sattel r 340 s 200 c 249 b 120 a 140
  s_select_general 1
  s_map_right_up
  s_gen_move 1671 259
  s_select_general 5
  s_map_right_up
  s_gen_move 1753 309			#g5 verschieben
  sleep 130
  left 1672 251 1		#v
  s_units c 249 s 1
  s_gen_attack 1647 228
  s_select_general 1
  s_gen_attack 945 624
  s_select_general 1
  s_units c -249 s 199 r 50
  s_select_general 5
  s_units r 1
  s_select_general 1
  s_gen_attack 909 691
  s_select_general 5
  sleep 6
  s_gen_attack 933 632			#blockangriff mit 1r (1)
  sleep 120
  left 1672 251 1		#v
  s_gen_move 1296 473			#v -vb
  s_select_general 2
  s_map_right_up
  s_gen_move 1435 361			#s_gen_move g
  s_select_general 3
  s_map_right_up
  s_gen_move 1602 475			#s_gen_move g
  s_select_general 4
  s_map_right_up
  s_gen_move 1426 296			#s_gen_move g
  sleep 190
  left 1296 468 1		#vb
  s_units r 50
  s_gen_attack 1367 461
  sleep 90
  left 1296 468 1		#vb
  s_units r 50
  s_gen_attack 1382 494
  sleep 100
  left 1296 468 1		#vb
  s_units r -30 s -200 b 120 a 130
  left 1435 356 1		#g
  s_units r 1
  s_gen_attack 1380 390			#blockangriff mit 1r (2)
  left 1296 468 0.3		#vb
  s_gen_attack 1332 419
  sleep 105
  left 1296 468 1		#vb
  s_gen_move 1270 356			#vb -vc
  sleep 140
  left 1270 351 1		#vc
  s_units a -130 b -50 s 200 r 50
  # -----------von hier
  s_gen_attack 1402 266
  sleep 140
  left 1270 351 1		#vc
  s_units r 50
  s_gen_attack 1311 191
  sleep 200
  #------------bis hier muss auskommentiert werden, falls das Folgende gebraucht wird.
  #s_gen_attack 1311 186
  #left 1426 291 1         #g
  #s_units r 1
  #sleep 6.5
  ## 5.0 : 0/1
  ## 5.5 : 
  ## 6.0 : 1/1
  ## 6.5 : 0/1
  ## 7.0 : 1/1
  ## 8.0 : 0/1
  #s_gen_attack 1402 261		#blockangriff mit 1r (3)
  #sleep 170
  left 1270 351 1		#vc
  s_units s -150 a 140 r 60
  s_gen_attack 1429 219
  sleep 165
  left 1270 351 1		#vc
  s_gen_move 1545 540			#vc -vd
  left 1602 470 1		#g
  s_units r 1
  sleep 160
  left 1545 535 1		#vd
  s_units a -140 s 100 r 100
  left 1602 470 1		#vb
  s_gen_attack 1639 494			#blockangriff mit 1r (4)
  left 1545 535 1		#vd
  s_gen_attack 1633 539
  s_select_general 1
  s_units s -150 r -100
  nachhause #r 100 s 200 c 249 b 20 a 140
;;
schädel|schaedel)
  s_abenteuer_starten schaedel r 120 e 170 c 220 a 30
  s_select_general 2
  s_map_right_up
  verschieb 1894 139 1574 431
  s_gen_move 1527 539
  s_units 2 c 219 e 1
  s_gen_attack 1026 577				# 1. Lager
  sleep 80
  Questbuch
  Belohnung
  s_units 2 c -219 r 50 e 170
  s_gen_attack 1239 474				# 2. Lager
  s_select_general 2
  s_gen_move 968 391
  sleep 20
  left 956 617 1
  left 1145 417 1
  left 850 365 1
  left 1108 262 1
  Questbuch
  sleep 20
  Belohnung
  sleep 30
  Belohnung
  s_units 2 e -12 r 62
  s_gen_attack 945 597				# 3. Lager
  s_units 2 r -40 e -158 c 175 e 1 r 13 a 30
  s_gen_attack 1084 466				# 4. Lager
  s_units 2 c -175 r -10 e -1 a -30
  nachhause r 100 e 170 c 220 a 30
;;
tropen)
  #Falls noch ein Abenteuer kommt, muss 4h gewartet werden, da Generäle verwundet werden.
  s_abenteuer_starten tropen r 300 e 230 c 191 a 74
  s_select_general 1
  s_map_right_up
  verschieb 1000 200 800 200
  s_gen_move 1774 374
  s_units 2 r 33
  s_units 3 r 26
  s_units 1 c 190
  s_gen_attack 922 623		#1. Lager
  s_select_general 1
  s_gen_move 653 705
  s_select_general 2
  s_map_right_up
  s_gen_move 1647 504
  s_units 1 c -190 r 200
  s_gen_attack 945 595		#2. Lager
  sleep 50
  s_select_general 2
  s_gen_attack 840 486		#Piratenbehausung 1. Welle
  sleep 60
  Questbuch
  Belohnung
  s_units 1 r -200 r 5 e 1 c 170 a 74
  s_gen_attack 850 506		#Piratenbehausung 2. Welle
  sleep 140
  Questbuch
  Belohnung
  sleep 20
  s_units 1 c -170 a -74 e -1 r 150 e 50
  s_gen_move 980 490
  s_select_general 3
  s_map_right_up
  verschieb 1000 200 500 700
  s_gen_move 1147 885
  s_select_general 1
  s_gen_attack 1074 487
  sleep 100
  s_select_general 3
  s_gen_attack 1040 307
  s_select_general 1
  s_gen_move 1074 345
  s_units 1 r -150 e -50 c 191
  s_gen_attack 982 577
  left 1059 365 1
  left 1617 688 1
  left 1063 969 1
  Questbuch
  sleep 10
  Belohnung
  s_units 1 c -191 e 200 r 50
  s_gen_attack 873 536
  s_units 1 e -198 r -50 c 191 a 20 r 37
  s_gen_attack 757 606
  s_units 1 c -191 a -20 e 198 r 50
  s_gen_attack 756 465
  s_units 1 r 50
  s_gen_attack 595 552
  Questbuch
  Belohnung
  s_units 1 e -200 r -50
  nachhause #e 230 c 191 a 74 r 100
;;
sumpf)
erstes=1
while true ; do
  s_star Diverses
  move 1157 943
  c=0
  s_star_all_down
  sumpfVorhanden=0
  for i in 11 21 31 41 51 61 12 22 32 42 52 62 13 23 33 43 53 63 ; do
    if [[ $(color $(s_starpos $i)) = $sumpf ]] ; then
      left $(s_starpos $i)
      left 903 826 2
      left 953 644 2
      sumpfVorhanden=1
      break
    fi
  done
  [[ $sumpfVorhanden -eq 0 ]] && break
  sleep 10
  s_star Spezialisten
  left $(s_starpos 11) 1
  if [[ $erstes -eq 1 ]] ; then s_units r 8 e 1 c 241 ; erstes=0 ; else s_units r 8 ; fi
  left 1835 526 0.5		#abenteuer
  left 1845 498 0.2		#armee senden
  left 840 510 0.2		#general anwählen
  left 955 777 0.5		#ok
  pause 15
  s_abenteuer_besuchen ; sleep 120
  s_select_general 1
  s_zoom_out ; s_map_right_up
  verschieb 1547 229 521 770
  s_gen_move 1194 528
  sleep 130
  left 1194 528 1
  s_units r -4
  s_gen_attack 1090 648
  sleep 200
  left 1194 528 1
  s_gen_move 1078 672
  sleep 165
  left 1078 672 1
  s_gen_attack 961 783
  sleep 220
  left 1078 672 1
  s_units r 4
  s_gen_attack 620 750
  sleep 190
  atabbrechen
  pause 18
done
;;
*)	leave "unknown argument '$1'"
;;
esac
shift
sleep 0.5
#end while
done
[[ $poweroffQ -eq 1 ]] && Poweroff