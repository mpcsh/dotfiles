# environment variables
export EDITOR="nvim"
export FZF_DEFAULT_COMMAND="rg --hidden --smart-case --glob !.git --files-with-matches ."
export FZF_DEFAULT_OPTS="--color=16,fg+:4 --ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_R_OPTS="--reverse"
export TERM="xterm-256color"
export SSH_ASKPASS="" # https://gist.github.com/joseluisq/d0e66c5f718250c90075
export GIT_ASKPASS=""
export NVIM_LISTEN_ADDRESS="/tmp/nvimsocket" # for nvr support

# don't cd with just a dirname
unsetopt AUTO_CD
# immediate job notifications
setopt notify
# if I do rm Downloads/* and there's nothing in Downloads, don't print a "no matches found" message
setopt nomatch
# don't warn before doing something like rm Downloads/*
setopt rm_star_silent
# don't autocorrect
unsetopt correct_all

# colorized manpages
export LESS_TERMCAP_mb=$(printf "\033[01;31m")
export LESS_TERMCAP_md=$(printf "\033[01;31m")
export LESS_TERMCAP_me=$(printf "\033[0m")
export LESS_TERMCAP_se=$(printf "\033[0m")
export LESS_TERMCAP_so=$(printf "\033[01;44;33m")
export LESS_TERMCAP_ue=$(printf "\033[0m")
export LESS_TERMCAP_us=$(printf "\033[01;32m")

# automatically source completions for newly installed packages
# https://wiki.archlinux.org/index.php/zsh#Persistent_rehash
zstyle ':completion:*' rehash true

# fuzzy completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# scripts
_dotfiles_bin=$HOME/dotfiles/bin
if test -e $_dotfiles_bin; then
  export PATH="$PATH:$_dotfiles_bin"
fi

# fzf
_fzf_path=/usr/share/fzf
if test -e $_fzf_path; then
  source $_fzf_path/completion.zsh
  source $_fzf_path/key-bindings.zsh
fi
_brew_fzf_path=~/.fzf.zsh
if test -e $_brew_fzf_path; then
  source $_brew_fzf_path
fi

# autojump
_z_path=~/.antigen/bundles/rupa/z
if test -e $_z_path; then
  source $_z_path/z.sh
fi

# comamnd-not-found
_pkgfile_path=/usr/share/doc/pkgfile
if test -e $_pkgfile_path; then
  source $_pkgfile_path/command-not-found.zsh
fi
