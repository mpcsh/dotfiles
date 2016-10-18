# high refresh when available
xrandr --rate 144 &

# themes!
xrdb ~/.Xresources
xrdb -merge ~/.colors/Xresources.dark
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
nice admiral | bar | sh &
nice dunst -fn "$(xrq font | sed 's/.*xft://g' | sed 's/:size=/ /g' | sed 's/:antialias.*//g')" &
nice redshift &
nice compton &

# keymaps
xmodmap ~/.config/xmodmap

# window manager
sxhkd &
exec bspwm
