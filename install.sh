#!/bin/sh  

exec chsh -s $(which zsh) &
exec cp -r .config/gxkb ~/.config/ &
cp -r .config/htop ~/.config/ &
cp -r .config/qtile ~/.config/ &
cp xlayout.sh ~ &
cp kblayout.sh ~ &
cp brightness.sh ~ &
cp fixf.sh ~ &
cp logout.sh ~ &
cp .vimrc ~ &
cp .xinitrc ~ &
cp .zshrc ~ 
