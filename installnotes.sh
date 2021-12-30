#Sound:
 alsa-utils alsa mixer pulseaudio pulseaudio-bluetooth pulsemixer

#Bluetooth
bluez bluez-utils  -- sudo systemctl enable bluetooth -- bluetoothctl adapter on, power on, scan on, pair-connect-trust. /etc/bluetooth/main.conf AutoEnable=true FastConnectable = true

#Editor
vim nvim

#Fonts
nerd-fonts-hack
nerd-fonts-monokai

#Terminal
Alacritty theme.sh zsh fzf zsh4human exa 

#Backup
timeshift

#wm
i3-gaps i3-resurrect polybar unclutter

#Media 
spotifyd spotify-tui mpv cava

#graphics
nvidia-settings -- xserver display configuration - advanced - force full composition pipeline
#Filemanager
ranger

#browser
paru -S google-chrome

#utilities
stow bpytop flameshot feh
