#!/bin/sh
count=`ps aux | grep -c scratchpad,ranger`
if [ $count -eq 1 ]; then
    alacritty --class scratchpad,ranger -e ranger
else
   i3-msg '[instance="scratchpad" class="ranger"] scratchpad show'
fi
