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


#setup zsh
chsh -s $(which zsh)
cd ~/.config/zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/Aloxaf/fzf-tab

#neovim

#Setup bluetooth
sed -i "#FastConnectable = false/FastConnectable = true/g" /etc/bluetooth/main.conf
sed -i "#AutoEnable=false/AutoEnable=true/g" /etch/bluetooth/main.conf
