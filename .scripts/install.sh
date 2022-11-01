#!/bin/bash

#update and install packages 
sudo pacman -Syu
sudo pacman -S --needed base-devel pulseaudio pulseaudio-bluetooth snapper alsa-utils neovim unclutter exa bat ranger pcmanfm alacritty firefox feh ueberzug sxhkd dunst rofi polybar pulsemixer git zsh nitrogen arandr stow bpytop bluez bluez-utils cups 


#systemd
sudo systemctl enable bluetooth

# stow
rm -rf ~/.config/i3
cd ~/dotfiles
stow *
