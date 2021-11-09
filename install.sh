#!/bin/bash  

echo [INSTALLER] DOWNLOADING SOFTWARE
source shell_scripts/install_downloader.sh

echo [INSTALLER] SETTING UP AUDIO
exec sudo alsactl restore &

echo [INSTALLER] CONFIGURING GIT
git config --global user.name "Neykuratick"
git config --global user.email "neykuratick@yahoo.com"
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=0' 

#echo [INSTALLER] MAKING ZSH DEFAULT SHELL
#exec chsh -s $(which zsh

echo [INSTALLER] COPYING ALL MY PERSONAL SCRIPTS AND CONFIG FILES
cp -r .config/htop ~/.config/ &
cp -r .config/qtile ~/.config/ &
cp -r .config/albert ~/.config/ &
cp .config/copyq/copyq.conf ~/.config/copyq/copyq.conf
cp shell_scripts/xlayout.sh ~ &
cp shell_scripts/kblayout.sh ~ &
cp shell_scripts/brightness.sh ~ &
cp shell_scripts/logout.sh ~ &
cp .vimrc ~ &
cp .xinitrc ~ &
cp .zshrc ~ &
cp nord.png ~

echo [INSTALLER] CONFIGURING AUTOSTART
exec sudo cp autostart_services/fixf.service /etc/systemd/system/fixf.service &
exec sudo cp shell_scripts/fixf.sh /usr/bin/fixf.sh &
exec sudo systemctl enable fixf.service &
exec sudo systemctl start fixf.service

exec echo [INSTALLER] DONE 
