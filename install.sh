#!/bin/bash  


function print() {
	stage="${1}"
	text="${2}"
	echo "[Dotfiles Installer: ${stage}]: ${text}"
}

print "PRECONFIGURING" "INSTALLING YAY"
./shell_scripts/install_yay.sh


print "DOWNLOADING" "CORE PACKAGES"
#sed "s/#.*$//g" ./shell_scripts/pkglist.txt | yay -S -
yay -S $(sed "s/#.*$//g" ./shell_scripts/pkglist.txt)

## TODO
##print "CONFIGURING" "ALSACTL"
##exec sudo alsactl restore

print "CONFIGURING" "GIT"
git config --global user.name "Neykuratick"
git config --global user.email "neykuratick@yahoo.com"
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=0' 
print "CONFIGURING" "Git user email and username: $(git config --global user.email); $(git config --global user.name)"

print "UNPACKING SCRIPT" "xlayout.sh (3 screens setup)" & cp shell_scripts/xlayout.sh ~
print "UNPACKING SCRIPT" "kblayout.sh (ru, eng keyboard" & cp shell_scripts/kblayout.sh ~
print "UNPACKING SCRIPT" "brightness.sh" & cp shell_scripts/brightness.sh ~
print "UNPACKING SCRIPT" "logout.sh (end x11 session" & cp shell_scripts/logout.sh ~
print "UNPACKING" ".config" & cp -r .config ~
print "UNPACKING" ".vimrc" & cp .vimrc ~
print "UNPACKING" ".xinitrc" & cp .xinitrc ~
print "UNPACKING" ".zshrc" & cp .zshrc ~
print "UNPACKING" "wallpaper" & cp nord.png ~/.config

print "CONFIGURING AUTOSTART" "keychron key fix"
sudo cp autostart_services/fixf.service /etc/systemd/system/fixf.service
sudo cp shell_scripts/fixf.sh /usr/bin/fixf.sh
sudo systemctl enable fixf.service
sudo systemctl start fixf.service

print "CONFIGURING" "DEFAULT SHELL"
exec chsh -s $(which zsh)

print "DONE" "DONE"
