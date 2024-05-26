function print() {
	status="${1}"
	text="${2}"
	echo "[Dotfiles Installer] ${text}: ${status}"

}

DOTFILES=~/dotfiles2

echo
echo

print "STARTED" "ENABLING PARALLEL DOWNLOADS"
sudo sed -i '/ParallelDownloads/s/^#//g' /etc/pacman.conf
print "DONE" "ENABLING PARALLEL DOWNLOADS"

echo
echo

print "STARTED" "INSTALLING PACKAGES FROM pkglist.txt"
yay -S $(sed "s/#.*$//g" $DOTFILES/pkglist.txt)
print "DONE" "INSTALLING PACKAGES FROM pkglist.txt"

echo
echo

print "STARTED" "COPYING DOTFILES"
mkdir -p ~/.config/hypr && cp -r $DOTFILES/.config/hypr/* ~/.config/hypr/
mkdir -p ~/.config/waybar && cp -r $DOTFILES/.config/waybar/* ~/.config/waybar/

cp $DOTFILES/.vimrc ~/.vimrc
cp $DOTFILES/.zshrc ~/.zshrc

cp $DOTFILES/scripts/connect_wifi.sh ~/
print "DONE" "COPYING DOTFILES"

echo
echo

print "STARTED" "CONFIGURING GIT"
read -p "Enter your github username: " username
read -p "Enter your github email: " email
git config --global user.name $username
git config --global user.email $email
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=0'
print "$(git config --global user.email), $(git config --global user.name)" "SET USERNAME AND PASSWORD TO"
print "DONE" "CONFIGURING GIT"

echo
echo

print "STARTED" "CONFIGURING DEFAULT SHELL"
chsh -s $(which zsh) || print "CONFIGURING" "FAILED TO SET ZSH AS THE DEFAULT SHELL"
print "DONE" "CONFIGURING DEFAULT SHELL"


echo
echo

echo "Installation is complete. Reboot your computer or login into your user once again"













