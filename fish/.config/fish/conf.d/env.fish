# environment variables
set -x EDITOR nvim
set -x FZF_DEFAULT_COMMAND "rg --files-with-matches ."
set -x FZF_DEFAULT_OPTS "--color=16,fg+:4 --ansi"
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_CTRL_R_OPTS "--reverse"
set -x TERM xterm-256color

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

function test_source
  if test -e $argv[1]
    source $argv[1]
  end
end

set -l autojump_bin /usr/local/share/autojump/autojump.fish
test_source $autojump_bin

set -l asdf_bin /usr/local/opt/asdf/asdf.fish
test_source $asdf_bin
