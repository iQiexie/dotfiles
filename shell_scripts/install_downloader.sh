#!/bin/bash

# installing minimal requirements
# alacritty - terminal
# gst-plugins-good, gst-libav - to make browser elagible to watch videos and not crash
# alsa-utils - make audio working
# bc - to make brightness.sh work as it uses this cli app (math)
# xdg-utils -sets up browser by default
# nss - some basic libraries chromium doesn't work without
# xwallpaper - sets wallpaper
# copyq clipboard manager
# peerflix streams media content directly from torrent link
# pirate-get searches for torrent links

# programs
sudo pacman -S --noconfirm vim htop xwalllpaper alacritty copyq obs-studio keepassxc zip unzip neofetch qtile xbindkeys emote peerflix pirate-get

# dependencies
sudo pacman -S --noconfirm zsh zsh-syntax-highlighting ttf-liberation xorg-xrandr gst-plugins-good gst-libav pulseaudio alsa-utils bc xdg-utils nss fuse
