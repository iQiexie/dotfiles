#!/bin/sh  

echo tets
exec xset r rate 300 30 
exec xbindkeys & 
exec ~/xlayout.sh &
exec xrandr --output DP-0 --mode "1920x1080" & 
#exec copyq & 
#exec flameshot &
exec echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode

