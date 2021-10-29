#!/bin/sh  

# installing minimal requirements
exec sudo pacman -S -noconfirm zsh zsh-syntax-highlighting ttf-font xorg-xrandr alacritty gst-plugins-good gst-libav pulseaudio &

# make zsh the default shell
exec chsh -s $(which zsh) &

exec cp -r .config/htop ~/.config/ &
cp -r .config/qtile ~/.config/ &
cp shell_scripts/xlayout.sh ~ &
cp shell_scripts/kblayout.sh ~ &
cp shell_scripts/brightness.sh ~ &
cp shell_scripts/fixf.sh ~ &
cp shell_scripts/logout.sh ~ &
cp .vimrc ~ &
cp .xinitrc ~ &
cp .zshrc ~ 
