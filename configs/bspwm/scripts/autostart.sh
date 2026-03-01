#!/bin/sh
    
pkill -x sxhkd
sxhkd -c ~/.config/bspwm/sxhkdrc &

pkill -x picom
picom -b

pkill -x polybar
polybar bspwm-DP-2 &
polybar bspwm-DP-0 &
