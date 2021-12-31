#!/bin/sh

exec ~/kblayout.sh &
exec ~/xlayout.sh &

xwallpaper --zoom nord.png &
/usr/lib/kdeconnectd & # starting kde connect daemon


qtile start &
copyq &
keepassxc
