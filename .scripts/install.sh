#!/bin/bash

#update and install packages 
sudo pacman -Syu
sudo pacman -S --needed --noconfirm base-devel pulseaudio pulseaudio-bluetooth snapper alsa-utils picom neovim unclutter exa bat ranger pcmanfm alacritty firefox feh ueberzug sxhkd dunst rofi polybar pulsemixer git zsh nitrogen arandr stow bpytop bluez bluez-utils cups python-pywal thunar 

#install yay
#cd /opt
#git clone https://aur.archlinux.org/yay.git
#cd /opt/yay
#makepkg -si

#install from aur
#yay -S --noconfirm google-chrome i3-ressurect 

#systemd
sudo systemctl enable bluetooth
sudo systemctl enable cups

# stow
rm -rf ~/.config/i3
cd ~/dotfiles
stow *

#install fonts
sudo cp ~/.fonts/* /usr/share/fonts
fc-cache -v /usr/share/fonts

#----------Configurations---------#

#setup zsh
chsh -s $(which zsh)
cd ~/.config/zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/Aloxaf/fzf-tab

#neovim

#Bluetoothsettings
#sed -i "#FastConnectable = false/FastConnectable = true/g" /etc/bluetooth/main.conf
#sed -i "#AutoEnable=false/AutoEnable=true/g" /etc/bluetooth/main.conf

#set caps to escape
sed -i '/Option "XkbLayout" "no"/a \ \ \ \ \ \ \  Option "XkbOptions" "caps:escape"' 00-keyboard.conf.bak
