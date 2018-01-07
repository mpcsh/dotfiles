# permissions
umask 077

# editor
export EDITOR='nvim'
export VISUAL="$EDITOR"
export PAGER='less'

# environment variables
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
export FZF_DEFAULT_OPTS='--color=16,fg+:4 --ansi'
export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git -l -g ""'
export FZF_CTRL_R_OPTS='--reverse'

# zsh options
setopt globdots # allow tab to match dotfiles
setopt nobanghist # allow bangs in quotes
setopt rm_star_silent # don't warn before doing something like rm ~/Downloads/*

# paths
export GOPATH='~/.go'
path=(
  /usr/local/sbin
  $GOPATH/bin
  $path
)
