# Software i use
Installs automatically
 - zsh
 - zsh-syntax-highlighting
 - ttf-font
 - xorg-xrandr
 - gst-plugins-good & gst-libav (for media decoding in minimal web browsers)
 - pulseaudio
 - qtile
 - alacritty (terminal)
 - bc (math in terminal)
 - xdg-utils (for setting up default apps)
 - nss (some basic libraries chromium doesn't work without)


<br>

Manual install
 - surf (web browser)
 - vimb (web browser)

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

# Default browser

To make chrome default browser, run:
<br> ```xdg-settings set default-web-browser chrome.desktop```

In order for the above command to work, there has to be chrome.AppImage file in the home directory. To modify this,
edit the 'Exec' line in chrome.desktop.
