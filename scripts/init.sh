#!/bin/bash
if xrandr | grep -q "HDMI-2 connected"; then
  xrandr --output HDMI-2 --auto --primary --output eDP-1 --off
elif xrandr | grep -q "^DP-1 connected"; then
  xrandr --output DP-1 --auto --primary --output HDMI-2 --off --output eDP-1 --off
else
  xrandr --auto
fi

xset dpms 0 0 0
xset -dpms
xset s off
setterm -balnk 0
nitrogen --restore
