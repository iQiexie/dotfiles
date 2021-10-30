#!/bin/bash  

echo [INSTALLER] DOWNLOADING SOFTWARE
source shell_scripts/install_downloader.sh

echo [INSTALLER] SETTING UP AUDIO
exec sudo alsactl restore &

echo [INSTALLER] CONFIGURING GIT
git config --global user.name "Neykuratick"
git config --global user.email "neykuratick@yahoo.com"
git config --global credential.helper cache

#echo [INSTALLER] MAKING ZSH DEFAULT SHELL
#exec chsh -s $(which zsh

echo [INSTALLER] COPYING ALL MY PERSONAL SCRIPTS AND CONFIG FILES
cp -r .config/htop ~/.config/ &
cp -r .config/qtile ~/.config/ &
cp shell_scripts/xlayout.sh ~ &
cp shell_scripts/kblayout.sh ~ &
cp shell_scripts/brightness.sh ~ &
cp shell_scripts/fixf.sh ~ &
cp shell_scripts/logout.sh ~ &
cp .vimrc ~ &
cp .xinitrc ~ &
cp .zshrc ~ 

exec echo [INSTALLER] DONE 
