# environment variables
set -x EDITOR nvim
set -x FZF_DEFAULT_COMMAND "rg --files-with-matches ."
set -x FZF_DEFAULT_OPTS "--color=16,fg+:4 --ansi"
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_CTRL_R_OPTS "--reverse"
set -x GIT_DUET_CO_AUTHORED_BY 1
set -x GIT_ASKPASS ""
set -x SSH_ASKPASS "" # https://gist.github.com/joseluisq/d0e66c5f718250c90075
set -x TERM xterm-256color

# umask
umask 077

# don't show annoying welcome message
set fish_greeting ""

# colorized manpages
set -x LESS_TERMCAP_mb (printf "\033[01;31m")
set -x LESS_TERMCAP_md (printf "\033[01;31m")
set -x LESS_TERMCAP_me (printf "\033[0m")
set -x LESS_TERMCAP_se (printf "\033[0m")
set -x LESS_TERMCAP_so (printf "\033[01;44;33m")
set -x LESS_TERMCAP_ue (printf "\033[0m")
set -x LESS_TERMCAP_us (printf "\033[01;32m")

# scripts
set -l dotfiles_bin ~/dotfiles/bin
if test -e $dotfiles_bin
  set -a fish_user_paths $dotfiles_bin
end

# fzf
set -l fzf_bin = ~/.fzf.fish
if test -e $fzf_bin
  source $fzf_bin
end

# autojump
set -l autojump_bin /usr/share/autojump/autojump.fish
if test -e $autojump_bin
  source $autojump_bin
end

set -l mac_autojump_bin /usr/local/share/autojump/autojump.fish
if test -e $mac_autojump_bin
  source $mac_autojump_bin
end

# rust
set -l rust_bin ~/.cargo/bin
if test -e $rust_bin
  set -a fish_user_paths $rust_bin
end
