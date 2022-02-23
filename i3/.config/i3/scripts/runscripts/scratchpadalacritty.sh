#!/bin/sh
count=`ps aux | grep -c scratchpad,alacritty`
if [ $count -eq 1 ]; then
    alacritty --class scratchpad,alacritty & 
else
   i3-msg '[instance="scratchpad" class="alacritty"] scratchpad show'
fi
