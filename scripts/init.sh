#!/bin/bash

xset dpms 0 0 0
xset -dpms
xset s off
setterm -balnk 0
nitrogen --restore
xrandr --output "eDP-1" --auto --output "HDMI-2" --auto --left-of  "eDP-1" --output "DP-1" --auto --left-of  "eDP-1"

