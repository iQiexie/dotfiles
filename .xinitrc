#!/bin/sh

exec ~/kblayout.sh &
exec ~/xlayout.sh &

xwallpaper --zoom nord.png &

qtile start &
copyq &
keepassxc
