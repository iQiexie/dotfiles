#!/bin/sh

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

exec ~/kblayout.sh &
exec ~/xlayout.sh &
xwallpaper --zoom ~/.config/nord.png &
xbindkeys &
exec dbus-launch qtile start
