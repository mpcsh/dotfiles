# don't show annoying welcome message
set fish_greeting ""

# permissions
umask 077

# environment variables
set -x fish_user_paths /usr/local/sbin
set -x EDITOR nvim
set -x FZF_DEFAULT_COMMAND 'rg --files-with-matches .'
set -x FZF_DEFAULT_OPTS '--color=16,fg+:4 --ansi'
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_CTRL_R_OPTS '--reverse'
set -x TERM xterm-256color

# colorized manpages
set -x LESS_TERMCAP_mb (printf "\033[01;31m")
set -x LESS_TERMCAP_md (printf "\033[01;31m")
set -x LESS_TERMCAP_me (printf "\033[0m")
set -x LESS_TERMCAP_se (printf "\033[0m")
set -x LESS_TERMCAP_so (printf "\033[01;44;33m")
set -x LESS_TERMCAP_ue (printf "\033[0m")
set -x LESS_TERMCAP_us (printf "\033[01;32m")

# autojump
set _autojump_bin /usr/share/autojump
if test -e $_autojump_bin
  source $_autojump_bin/autojump.fish
end

# scripts
set dotfiles_bin ~/dotfiles/bin
if test -e $dotfiles_bin
  set -x fish_user_paths $_dotfiles_bin $fish_user_paths
end

# SML
set sml_bin /usr/lib/smlnj/bin
if test -e $sml_bin
  set -x fish_user_paths $_sml_bin $fish_user_paths
end
