#bin!/bash
killall spotifyd
spotifyd
exec alacritty -e i3-resurrect restore -w 5
