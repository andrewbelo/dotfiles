#!/bin/bash
if xrandr | grep -q "HDMI-2 connected"; then
    xrandr --output HDMI-2 --auto --primary --output eDP-1 --off
    echo HDMI-2
elif xrandr | grep -q "^DP-1 connected"; then
    xrandr --output DP-1 --auto --primary --output HDMI-2 --off --output eDP-1 --off
    echo edp-1
else
    xrandr --output DP-1 --auto --primary
    echo none
fi

xset dpms 0 0 0
xset -dpms
xset s off
setterm -balnk 0
nitrogen --restore
