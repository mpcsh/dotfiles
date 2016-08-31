#themes!
xrdb ~/.Xresources
xrdb -merge ~/.Xfonts
xrdb -merge ~/.colors/sourcerer.Xresources
bspc config focused_border_color $(xrq color1)
source ~/.bash_aliases; setbg &

#basic xorg settings
xsetroot -cursor_name left_ptr &

#no bell
xset -b &

#key repeat rate
xset r rate 250 &

#no mouse acceleration
xset m 1 0 &

#disable auto screensaver
xset s off -dpms &

#autostart apps
bar &
nice dunst -fn "$(xrq barFont | sed 's/.*xft://g' | sed 's/:size=/ /g' | sed 's/:antialias.*//g')" &
nice redshift &
nice compton &

#window manager
sxhkd &
exec bspwm
