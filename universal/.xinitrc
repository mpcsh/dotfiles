#themes!
xrdb ~/.Xresources
xrdb -merge ~/.colors
feh --bg-scale ~/.wallpaper &

#basic xorg settings
xsetroot -cursor_name left_ptr &

#no bell
xset -b

#key repeat rate
xset r rate 250 &

#no mouse acceleration
xset m 1 0 &

#disable auto screensaver
xset s off -dpms &

#autostart apps
bar &
nice redshift &

#window manager
sxhkd &
exec bspwm
