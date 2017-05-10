# high refresh when available
xrandr --rate 144 &

# themes!
xrdb ~/.Xresources
xrdb -merge ~/.colors/xresources/gruvbox-dark.xresources
source ~/.bash_aliases; setbg &

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
redshift &
compton -r 6 -o 0.75 &
run_keybase &

# keymaps
xmodmap ~/.config/xmodmap

# window manager
sxhkd &
exec bspwm
