# environment variables
export GOPATH=~/.go
export EDITOR=nvim

# zsh configuration
ENABLE_CORRECTION="true" # enable command autocorrection
unsetopt AUTO_CD # don't cd with just a dirname
setopt notify # immediate job notifications
setopt nomatch # if I do rm Downloads/* and there's nothing in Downloads, don't print a "no matches found" message
setopt rm_star_silent # don't warn before doing something like rm Downloads/*

# github.com/rupa/z
source /usr/local/etc/profile.d/z.sh
