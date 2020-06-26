# environment variables
set -x EDITOR nvim
set -x FZF_DEFAULT_COMMAND "rg --files-with-matches ."
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
function set_colors
  set -U fish_color_cancel "red"
  set -U fish_color_command "foreground" "--bold"
  set -U fish_color_end "yellow"
  set -U fish_color_error "red" "--underline"
  set -U fish_color_escape "cyan"
  set -U fish_color_normal "normal"
  set -U fish_color_operator "blue"
  set -U fish_color_param "blue"
  set -U fish_color_quote "green"
  set -U fish_color_redirection "yellow"
  set -U fish_color_search_match "--reverse"
  set -U fish_pager_color_completion "normal" "--bold" "--underline"
  set -U fish_pager_color_description "yellow"
  set -U fish_pager_color_progress "yellow"
end

function set_dark_colors
  set -U fish_pager_color_prefix "brgreen"
  set -U fish_color_comment "brgreen"
  set -U fish_color_autosuggestion "brgreen" "--underline"
  set -Ux FZF_DEFAULT_OPTS "--color=16,fg+:4,bg+:0 --ansi"
  set_colors
end

function set_light_colors
  set -U fish_pager_color_prefix "brcyan"
  set -U fish_color_comment "brcyan"
  set -U fish_color_autosuggestion "brcyan" "--underline"
  set -Ux FZF_DEFAULT_OPTS "--color=16,fg+:4,bg+:7 --ansi"
  set_colors
end

if type -q osascript
  if test (osascript -e 'tell application "System Events" to tell appearance preferences to get dark mode') = "true"
    set_dark_colors
  else
    set_light_colors
  end
  trap "set_dark_colors" SIGUSR1
  trap "set_light_colors" SIGUSR2
else
  set_dark_colors
end

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
