#!bin/bash

#update and install packages 
sudo pacman -Syu
sudo pacman -S --needed base-devel pulseaudio pulseaudio-bluetooth alsa-mixer snapper alsa-utils neovim unclutter exa bat ranger alacritty firefox feh ueberzug sxkhd dunst rofi polybar pulsemixer git man zsh nitrogen arandr stow bpytop bluez bluez-utils cups 


#systemd
sudo systemctl enable bluetooth

# clone repo
sudo git clone https://github.com/MortenMortenson/dotfiles.git
rm -rf ~/.config/i3
cd dotfiles
stow -v
