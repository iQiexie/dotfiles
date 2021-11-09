# Software i use
Installs automatically
 - zip & unzip
 - zsh & zsh-syntax-highlighting
 - xorg-xrandr & xwallpaper
 - gst-plugins-good & gst-libav (for media decoding in minimal web browsers)
 - pulseaudio
 - vim
 - ttf-font
 - qtile
 - alacritty (terminal)
 - bc (math in terminal)
 - xdg-utils (for setting up default apps)
 - nss (some basic libraries chromium doesn't work without)

<br>

Manual install
 - surf (web browser)
 - vimb (web browser)
 - ungoogled chromium (web browser)
 - albert (command line)
 - deepin-screenshot (screenshots)

# Description

Chromium extensions:
 - Adblock Plus
 - Chromium Web Store <span class="external-link"><a href="https://github.com/NeverDecaf/chromium-web-store" target="_blank">how to set up</a></span>
 - SponsorBlock for YouTube - Skip Sponsorships

<br>

Personal shell scripts:
 - brightness.sh controls screen brightness. <br>
   Usage: ```./brightness.sh {desired brightness in percents} ```
 - fixf.sh fixes F-keys for Keychrone keyboards
 - xlayout.sh sets display layout for x server

# How to install automatically
Run installer script: 
<br>
```
cd dotfiles
./install.sh
```

Installing yay
```
cd shell_scripts
mkdir temp
cp install_yay temp
cd temp
./install_yay
cd ..
rm -rf temp
```
