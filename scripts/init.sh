#!/bin/bash

xset dpms 0 0 0
xset -dpms
xset s off
setterm -balnk 0

xss-lock --transfer-sleep-lock -- i3lock --nofork
nm-applet

nitrogen --restore
setxkbmap -layout us,ua -option 'grp:alt_shift_toggle' -option caps:escape
xrandr --output "eDP-1" --auto --output "HDMI-2" --auto --left-of  "eDP-1" --output "DP-1" --auto --left-of  "eDP-1"
/usr/libexec/gsd-xsettings
picom -b

ibus exit
