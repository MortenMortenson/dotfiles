#!/bin/sh
count=`ps aux | grep -c scratchpad,btop`
if [ $count -eq 1 ]; then
    alacritty --class scratchpad,btop -e btop
else
   i3-msg '[instance="scratchpad" class="btop"] scratchpad show'
fi
