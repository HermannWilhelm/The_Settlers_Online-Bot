#!/bin/bash
# Gibt die Koordianen der aktuellen Cursor-Position an
# Argumente:
# x|y	Gibt nur den x- bzw y-Wert an
# _	Trennt die Koordinaten durch _ anstatt durch space

coords=$(xdotool getmouselocation 2> /dev/null | sed 's/x://;s/y://;s/ screen:.*$//')

case $1 in
	x) echo ${coords% *}	;;
	y) echo ${coords#* }	;;
	_) echo ${coords/ /_}	;;
	*) echo $coords	;;
esac

