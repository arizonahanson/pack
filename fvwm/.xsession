xmodmap -e "pointer = 1 2 3 4 5 6 7 0 0 0"
xrdb -merge "$HOME/.Xresources"
xsetroot -mod 3 3 -fg grey20 -bg grey10
exec fvwm
