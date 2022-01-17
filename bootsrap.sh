#!bin/bash
sudo pacman -Syu

#system packages
sudo pacman -S --needed base-devel bluez bluez-utils pulseaudio pulseaudio-bluetooth alsa-utils alsa-mixer git vim stow paru

#Dotfiles
rm ~/.config/i3/config
cd ~
cd ~/dotfiles
stow -v *



