# Software I use

### Installs automatically
 - zsh & zsh-syntax-highlighting
 - xorg-xrandr
 - gst-plugins-good & gst-libav (for media decoding in minimal web browsers)
 - pulseaudio
 - obs-studio
 - vim & nvim (vim mostly)
 - qtile (window manager)
 - alacritty (terminal)
 - bc (math in terminal)
 - xdg-utils (for setting up default apps)
 - nss (some basic libraries chromium doesn't work without)
 - surf (web browser)
 - ungoogled chromium (web browser)

### Software I'm currently trying to use
 - vimb (web browser)
 - albert-bin (command line)
 - deepin-screenshot (screenshots)
 - scrot (cli screenshot)
 - keepassxc (password manager)
 - ubuntu-characters (emoji keyboard)
 - emote (emoji keyboard)
 - grip (realtime .md renderer)

### Chromium extensions:
 - Adblock Plus
 - Chromium Web Store <span class="external-link"><a href="https://github.com/NeverDecaf/chromium-web-store" target="_blank">how to set up</a></span>
 - SponsorBlock for YouTube - Skip Sponsorships
 - AutoScroll
 - KeePassXC-Browser

### Personal shell scripts:
 - brightness.sh controls screen brightness. <br>
   Usage: ```./brightness.sh {desired brightness in percents} ```
 - fixf.sh fixes F-keys for Keychrone keyboards
 - xlayout.sh sets display layout for x server

More details in ./shell_scripts/readme.md

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

# How to install on fresh arch
```
cd dotfiles
./install.sh
cd shell_scripts

cd shell_scripts
mkdir temp
cp install_yay temp
cd temp
./install_yay
cd ..
rm -rf temp

yay -S albert-bin
cd ..
cd ..
cp dotfiles/.config .
reboot
```


# Configuration files

- Autostart programms are configured here ``` ~/.config/qtile/autoshart.sh ```
- HotKeys are binded kere ``` .xbindkeysrc ```
- Aliases are set here ``` .zshrc ``` in "Aliases" section
