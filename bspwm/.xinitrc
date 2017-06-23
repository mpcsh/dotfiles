#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# high refresh when available
if [[ $HOSTNAME == "annapurna" ]]; then
	xrandr --rate 144 &
fi

# themes!
xrdb ~/.Xresources
xrdb -merge ~/.colors/xresources/gruvbox-dark.xresources
source ~/.bash_aliases; setbg &

# hidpi
if [[ $HOSTNAME == "huascaran" ]]; then
	echo "Xft.dpi: 144" | xrdb -merge
else
	echo "Xft.dpi: 96" | xrdb -merge
fi

# basic xorg settings
xsetroot -cursor_name left_ptr &

# no bell
xset -b &

# key repeat rate
xset r rate 250 &

# no mouse acceleration
xset m 1 0 &

# disable auto screensaver
xset s off -dpms &

# autostart apps
redshift -l geoclue2 -t 5500:3300 &
compton -I 0.01 -O 0.01 -D 3 &
run_keybase &

# keymaps
xmodmap ~/.config/xmodmap

# window manager
sxhkd &
exec bspwm
