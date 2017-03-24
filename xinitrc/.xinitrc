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
nice redshift &
nice compton -r 6 -o 0.75 &
nice dunst -fn "$(xrq font | cut -d: -f2) $(bc <<< "$(xrq font | cut -d= -f2)*$(xrq Xft.dpi)/96")" &
nice run_keybase &

# keymaps
xmodmap ~/.config/xmodmap

# window manager
sxhkd &
exec bspwm
