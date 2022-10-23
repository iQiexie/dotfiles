#!/bin/bash

cd ~/dotfiles/shell_scripts
mkdir temp
cd temp
git clone https://aur.archlinux.org/yay-git.git &
sleep 5s
mv $(pwd)/yay-git/PKGBUILD $(pwd) &&
makepkg -si
cd ~/dotfiles/shell_scripts
rm -rf temp
