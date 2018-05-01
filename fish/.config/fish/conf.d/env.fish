# don't show annoying welcome message
set fish_greeting ""

# environment variables
set -x GOPATH ~/.go
set -x _pyenv_ROOT ~/.pyenv
set -x fish_user_paths /usr/local/sbin
set -x EDITOR nvim
set -x FZF_DEFAULT_COMMAND 'rg --files-with-matches .'
set -x FZF_DEFAULT_OPTS '--color=16,fg+:4 --ansi'
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_CTRL_R_OPTS '--reverse'
set -x TERM xterm-256color

# permissions
umask 077

# go
set _go_path $GOPATH/bin
if test -e $_go_path
  set -x fish_user_paths $_go_path $fish_user_paths
end

# pyenv
set _pyenv_shims $_pyenv_ROOT/shims
set _pyenv_bin $_pyenv_ROOT/bin
if test -e $_pyenv_shims; and test -e $_pyenv_bin
  set -x fish_user_paths $_pyenv_shims $_pyenv_bin $fish_user_paths
  status --is-interactive; and source (pyenv init -|psub)
  status --is-interactive; and source (pyenv virtualenv-init -|psub)
end

# scripts
set _dotfiles_bin ~/dotfiles/bin
if test -e $_dotfiles_bin
  set -x fish_user_paths $_dotfiles_bin $fish_user_paths
end

# SML
set _sml_bin /usr/lib/smlnj/bin
if test -e $_sml_bin
  set -x fish_user_paths $_sml_bin $fish_user_paths
end

# autojump
set _autojump_bin /usr/share/autojump
if test -e $_autojump_bin
  source $_autojump_bin/autojump.fish
end

# colorized manpages
set -x LESS_TERMCAP_mb (printf "\033[01;31m")
set -x LESS_TERMCAP_md (printf "\033[01;31m")
set -x LESS_TERMCAP_me (printf "\033[0m")
set -x LESS_TERMCAP_se (printf "\033[0m")
set -x LESS_TERMCAP_so (printf "\033[01;44;33m")
set -x LESS_TERMCAP_ue (printf "\033[0m")
set -x LESS_TERMCAP_us (printf "\033[01;32m")
