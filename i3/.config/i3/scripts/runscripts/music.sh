#bin!/bash

killall spotifyd &
spotifyd &
exec /usr/bin/alacritty --class spt,spt -e spt &
exec /usr/bin/alacritty --class pulsemixer,pulsemixer -e pulsemixer &
exec /usr/bin/alacritty --class cava,cava -e cava &
