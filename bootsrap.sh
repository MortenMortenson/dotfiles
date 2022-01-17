#!bin/bash
sudo pacman -Syu

#system packages
sudo pacman -S --needed base-devel bluez bluez-utils pulseaudio pulseaudio-bluetooth alsa-utils git vim stow paru

#Dotfiles
rm ~/.config/i3/config
cd ~/dotfiles
stow -v 

#utilis
sudo pacman -S -needed polybar alacritty rofi unclutter feh ueberzug ranger exa 

yay -S nerd-fonts-mononoki i3-ressurect theme.sh

