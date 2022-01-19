#Sound:
 alsa-utils alsa mixer pulseaudio pulseaudio-bluetooth pulsemixer

#Bluetooth
bluez bluez-utils  -- sudo systemctl enable bluetooth -- bluetoothctl adapter on, power on, scan on, pair-connect-trust.

sed -i "#FastConnectable = false/FastConnectable = true/g" /etc/bluetooth/main.conf
sed -i "#AutoEnable=false/AutoEnable=true/g" /etch/bluetooth/main.conf

Enable fn-keys https://mikeshade.com/posts/keychron-linux-function-keys/

#Editor
vim nvim

#Fonts
nerd-fonts-hack
nerd-fonts-monokai

#Terminal
Alacritty theme.sh zsh fzf exa 
rofi
#zsh
	#syntax highlighting: cd ~/.config/zsh
 git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

powerlevel10k fzf-tab zsh-autosuggestions

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

#set caps to escape
sed '/Option "XkbLayout" "no"/a \ \ \ \ \ \ \  Option "XkbOptions" "caps:escape"' 00-keyboard.conf.bak
