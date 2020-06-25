# environment variables
set -x EDITOR nvim
set -x FZF_DEFAULT_COMMAND "rg --files-with-matches ."
set -x FZF_DEFAULT_OPTS "--color=16,fg+:4 --ansi"
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_CTRL_R_OPTS "--reverse"
set -x TERM xterm-256color
set -x NVIM_LISTEN_ADDRESS "/tmp/nvimsocket-$fish_pid"

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

# mode-dependent colors
function set_light_dark_colors
  if test (osascript -e 'tell application "System Events" to tell appearance preferences to get dark mode') = "true"
    set -U fish_pager_color_prefix "brgreen"
    set -U fish_color_comment "brgreen"
    set -U fish_color_autosuggestion "brgreen" "--underline"
  else
    set -U fish_pager_color_prefix "brcyan"
    set -U fish_color_comment "brcyan"
    set -U fish_color_autosuggestion "brcyan" "--underline"
  end
end

set_light_dark_colors
trap "set_light_dark_colors" SIGUSR1

if ! status --is-interactive
  exit
end

# prompt
starship init fish | source

function test_source
  if test -e $argv[1]
    source $argv[1]
  end
end

test_source /usr/local/opt/asdf/asdf.fish
test_source ~/.asdf/asdf.fish
