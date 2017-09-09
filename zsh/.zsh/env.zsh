# environment variables
export TZ=:/etc/localtime # https://blog.packagecloud.io/eng/2017/02/21/set-environment-variable-save-thousands-of-system-calls/
export GOPATH=~/.go
export EDITOR=nvim

# zsh configuration
ENABLE_CORRECTION="true" # enable command autocorrection
setopt rm_star_silent # don't warn before doing something like rm ~/Downloads/*
setopt notify # immediate job notifications
setopt autopushd # make cd work like pushd
autoload -U zmv # mass-rename file utility
