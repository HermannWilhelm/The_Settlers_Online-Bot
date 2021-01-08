#!/bin/bash

# programmed for Die Stämme,
# usage :
# click coords_start coords_end steps [repeat]
# TBC Verstehe ich gerade nicht, vielleicht nochmal read nachscahuen

sx=$(gml x)
sy=$(gml y)
echo -n "Zielkoordinaten"
read
zx=$(gml x)
zy=$(gml y)

echo $sx $sy $zx $zy


case $# in
1)	r=1		;;
2)	r=$2		;;
*)	echo "click: 1 or 2 arguments expected" ;;
esac



while (( r-- )) ; do
	sleep 1
	for i in $(seq 0 $1) ; do
		left $(echo "$sx+$i*($zx-$sx)/$1" | bc -l) $(echo "$sy+$i*($zy-$sy)/$1" | bc -l)
	done
done
