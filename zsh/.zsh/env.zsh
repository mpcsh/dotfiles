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
