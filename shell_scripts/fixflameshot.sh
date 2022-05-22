# Whenever flameshot doesn't copy to clipboard, run this script. The problem is in xbindkeys that doesn't respect norify d-bus service or whatever

killall xbindkeys
xbindkeys
