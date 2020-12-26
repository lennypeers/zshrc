#!/bin/bash

# bspwm
# move the focused window to a specific point x,y
# deps: xorg-xwininfo

# add the target here (format: x-y)
# mebbe reading from argument is better?
pos=(900-46 900-580 20-580 20-46 451-306)
id=$(bspc query -N -n .local.focused.\!fullscreen)

{
read _ _ _ x
read _ _ _ y
} <<< $(xwininfo -id $id | grep Absolute)

IFS=- read xt yt <<< ${pos[${1:-0}]:-${pos[0]}}

bspc node $id -v $(($xt-$x)) $(($yt-$y))
