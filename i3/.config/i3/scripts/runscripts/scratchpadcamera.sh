#!/bin/sh
count=`ps aux | grep -c scratchpad,mpv`
if [ $count -eq 1 ]; then
    /$HOME/.config/i3/scripts/runscripts/camerascratch.sh &
else
   i3-msg '[instance="scratchpad" class="mpv"] scratchpad show'
fi
