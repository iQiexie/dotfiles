#!  /bin/bash

if (($1>=100)); then
	brightness=1
else
	brightness=$(echo "scale=2; $1 / 100" | bc)
fi

echo "brightness: Changed brightness to $(echo "scale=0; $brightness * 100" | bc)%" 

xrandr --output DP-0  --brightness $brightness
xrandr --output DVI-D-0  --brightness $brightness
xrandr --output HDMI-0  --brightness $brightness
