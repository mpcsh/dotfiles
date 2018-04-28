# environment variables
export EDITOR="nvim"
export FZF_DEFAULT_COMMAND="command rg --hidden --smart-case --glob !.git --files-with-matches ."
export FZF_DEFAULT_OPTS="--color=16,fg+:4 --ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_R_OPTS="--reverse"
export GOPATH="$HOME/.go"
export PAGER="less -FR"
export PYENV_ROOT="~/.pyenv"
export TERM="screen-256color"
export DISABLE_AUTO_TITLE="true" # https://github.com/robbyrussell/oh-my-zsh/issues/1338
export SSH_ASKPASS="" # https://gist.github.com/joseluisq/d0e66c5f718250c90075
export GIT_ASKPASS=""

# zsh configuration
ENABLE_CORRECTION="true" # enable command autocorrection
unsetopt AUTO_CD # don't cd with just a dirname
setopt notify # immediate job notifications
setopt nomatch # if I do rm Downloads/* and there's nothing in Downloads, don't print a "no matches found" message
setopt rm_star_silent # don't warn before doing something like rm Downloads/*

# permissions
umask 077

# go
_go_path="$GOPATH/bin"
if test -e $_go_path; then
  export PATH="$PATH:$_go_path"
fi

# scripts
_dotfiles_bin="$HOME/dotfiles/bin"
if test -e $_dotfiles_bin; then
  export PATH="$PATH:$_dotfiles_bin"
fi

# fzf
_fzf_path="/usr/share/fzf"
if test -e $_fzf_path; then
  source $_fzf_path/completion.zsh
  source $_fzf_path/key-bindings.zsh
fi

# autojump
_z_path="/usr/lib/z.sh"
if test -e $_z_path; then
  source $_z_path
fi

# colorized manpages
export LESS_TERMCAP_mb=$(printf "\033[01;31m")
export LESS_TERMCAP_md=$(printf "\033[01;31m")
export LESS_TERMCAP_me=$(printf "\033[0m")
export LESS_TERMCAP_se=$(printf "\033[0m")
export LESS_TERMCAP_so=$(printf "\033[01;44;33m")
export LESS_TERMCAP_ue=$(printf "\033[0m")
export LESS_TERMCAP_us=$(printf "\033[01;32m")
