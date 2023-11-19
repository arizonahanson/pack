#!/bin/sh

xrdb -merge "$HOME/.Xresources"
xrandr -s 2560x1440
xmodmap -e "pointer = 1 2 3 4 5 6 7 0 0 0"

exec i3
