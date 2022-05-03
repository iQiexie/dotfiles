
# Sections

## FAQ

### Beginner Linux Tips

- chmod +x {file name} - To make something exectable

- Installing .tar.gz apps https://www.howtogeek.com/423866/how-to-install-and-use-the-tor-browser-on-linux/

- Setting up default apps: https://askubuntu.com/questions/1219614/xdg-open-doesnt-do-anything-zoom-in-chromium https://www.maketecheasier.com/create-desktop-file-linux/

- pacman speeding up: ``` sudo pacman-optimize ```

- Run app in background: ``` {some app} & disown ```

- To install a binary of some sort instead of searching for appimage search for "bin" version. Then, when you have finally downloaded your package, run ``` sudo pacman -U {package name} ```


### Possible problems and solutions

- fixing audio not working tutorial https://superuser.com/questions/626606/how-to-make-alsa-pick-a-preferred-sound-device-automatically

	run alsamixer for device ids

	there are channels in alsamixer displayed under the sound sources. Make sure it's not muted (press M) and make sure it's not true that inly left or right channel is muted (OM, MO, MM)
	It might be diffficult to see letters (especially "O", but they're there)


### Qtile related

- qtile config reference: https://gitlab.com/OldTechBloke/dotfiles/-/blob/master/.config/qtile/config.py

- in case if apps in the qtile tray are on different monitors, run meta+ctrl+r to reload qtile config


### Gaming

- installing games in lutris https://forums.lutris.net/t/very-brief-tutorial-on-manually-installing-a-game-in-lutris/2028


### Other

- vscode launches on "code" command

- https://searx.github.io/searx/user/search_syntax.html Searx shortcuts

- ranger -> press Z -> press H. To show hidden files

- java package for minecraft is jdk-adoptopenjdk


## Key bindings

### Alacritty

config: ``` (path to config file) ```
 - ctrl+=, ctrl++ - increase fontsize (zoom in)
 - ctrl+- - decrease fontsize (zoom out)
 - super+v - paste


## Personal notes

### Todo
 - xbacklight nvidia
 - make shortcut obs --scene Desktop1 --startrecording
 - https://www.youtube.com/watch?v=tnspdGZGEPE keep home clean. zshenv vars



### Setting up default apps:

xdg-mime query default <MIMETYPE> - To see the default app for a fyletype
	example: xdg-mime query default image/png

xdg-mime query filetype <file name> - To see the MIMETYPE  of a particular file (alternative: https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Common_types) 
	example: xdg-mime query filetype image.png

xdg-mime default <app>.desktop <MIMETYPE> - To set an app by default for the specific MIMETYPE
	example xdg-mime default feh.desktop image/png
