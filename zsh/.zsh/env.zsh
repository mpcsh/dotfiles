# environment variables
export GOPATH=~/.go
export EDITOR=nvim
export PAGER="less -FRX" # don't use pager for `git ls`, etc
export TERM=xterm-256color # for ssh compatibility
export TZ=:/etc/localtime # https://blog.packagecloud.io/eng/2017/02/21/set-environment-variable-save-thousands-of-system-calls/

# zsh configuration
ENABLE_CORRECTION="true" # enable command autocorrection
autoload -U zmv # mass-rename file utility

setopt autopushd # make cd work like pushd
setopt nomatch # if I do rm Downloads/* and there's nothing in Downloads, don't print a "no matches found" message
setopt notify # immediate job notifications
setopt rm_star_silent # don't warn before doing something like rm Downloads/*
