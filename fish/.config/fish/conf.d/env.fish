# environment variables
set -x EDITOR nvim
set -x FZF_DEFAULT_COMMAND "rg --files-with-matches ."
set -x FZF_DEFAULT_OPTS "--color=16,fg+:4 --ansi"
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_CTRL_R_OPTS "--reverse"
set -x GIT_DUET_CO_AUTHORED_BY 1
set -x GIT_ASKPASS ""
set -x NVIM_LISTEN_ADDRESS "/tmp/nvimsocket" # for nvr support
set -x SSH_ASKPASS "" # https://gist.github.com/joseluisq/d0e66c5f718250c90075
set -x TERM xterm-256color
if test (hostname) = "cs-vm"
  set -x REQUESTS_CA_BUNDLE "/etc/ssl/certs/ca-certificates.crt"
end

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
set dotfiles_bin ~/dotfiles/bin
if test -e $dotfiles_bin
  set -x fish_user_paths $fish_user_paths $dotfiles_bin
end

# fzf
set fzf_bin = ~/.fzf.fish
if test -e $fzf_bin
  source $fzf_bin
end

# mactex
set mactex_path /Library/TeX/texbin
if test -e $mactex_path
  set -x fish_user_paths $fish_user_paths $mactex_path
end

# autojump
set autojump_bin /usr/local/share/autojump/autojump.fish
if test -e $autojump_bin
  source $autojump_bin
end
set linux_autojump_bin /usr/share/autojump/autojump.fish
if test -e $linux_autojump_bin
  source $linux_autojump_bin
end

# SML
set sml_bin /usr/lib/smlnj/bin
if test -e $sml_bin
  set -x fish_user_paths $_sml_bin $fish_user_paths
end

# rust
set rust_bin ~/.cargo/bin
if test -e $rust_bin
  set -x fish_user_paths $rust_bin $fish_user_paths
end
