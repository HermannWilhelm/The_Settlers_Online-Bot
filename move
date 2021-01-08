#!/bin/bash

xdotool mousemove $(echo $* | sed 's/[^0-9.]/ /g')
