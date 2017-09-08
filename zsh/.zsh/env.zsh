# for ssh compatibility
export TERM=xterm-256color

# enable command autocorrection
ENABLE_CORRECTION="true"

# immediate job notifications
setopt notify

# make cd work like pushd
setopt autopushd

# mass-rename file utility
autoload -U zmv

# add scripts to $PATH
export PATH="~/dotfiles/scripts:$PATH"

# gopath
export GOPATH=~/.go

# https://blog.packagecloud.io/eng/2017/02/21/set-environment-variable-save-thousands-of-system-calls/
export TZ=:/etc/localtime
