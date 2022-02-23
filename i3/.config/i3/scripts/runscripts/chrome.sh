#!/bin/sh
count=`ps aux | grep -c google-chrome`
if [ $count -le 1 ]; then
    google-chrome-stable
else
   i3-msg workspace 2
fi

