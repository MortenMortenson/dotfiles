#Sound:
 alsa-utils alsa mixer pulseaudio pulseaudio-bluetooth pulsemixer

#Bluetooth
bluez bluez-utils  -- sudo systemctl enable bluetooth -- bluetoothctl adapter on, power on, scan on, pair-connect-trust.

sed -i "#FastConnectable = false/FastConnectable = true/g" /etc/bluetooth/main.conf
sed -i "#AutoEnable=false/AutoEnable=true/g" /etch/bluetooth/main.conf


#Editor
vim nvim

#Fonts
nerd-fonts-hack
nerd-fonts-monokai

#Terminal
Alacritty theme.sh zsh fzf zsh4human exa 

#zsh
	#syntax highlighting: cd ~/.config/zsh
 git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc



#Backup
timeshift

#wm
i3-gaps i3-resurrect polybar unclutter

#Media 
spotifyd spotify-tui mpv cava

#graphics
nvidia-settings -- xserver display configuration - advanced - force full composition pipeline
redshift
#Filemanager
ranger

#browser
paru -S google-chrome

#utilities
stow bpytop flameshot feh ueberzeug
