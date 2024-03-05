DOTFILES=~/dotfiles2

rm -rf $DOTFILES/.config/waybar/* && cp -r ~/.config/waybar/* $DOTFILES/.config/waybar/
rm -rf $DOTFILES/.config/hypr/* && cp -r ~/.config/hypr/* $DOTFILES/.config/hypr/

cp ~/.vimrc $DOTFILES/.vimrc
cp ~/.zshrc $DOTFILES/.zshrc

cp ~/connect_wifi.sh $DOTFILES/scripts/connect_wifi.sh
