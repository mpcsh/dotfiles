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
nice dunst -fn "$(xrq font | cut -d: -f2) $(( $(xrq font | cut -d= -f2) * $(( $(xrq Xft.dpi) / 96 )) ))" &
nice seaf-daemon -c ~/.ccnet -d ~/Seafile/.seafile-data -w ~/Seafile &
nice redshift &
nice compton &
nice run_keybase &

# keymaps
xmodmap ~/.config/xmodmap

# window manager
sxhkd &
exec bspwm
