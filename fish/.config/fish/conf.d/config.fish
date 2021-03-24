# environment variables
set -x EDITOR nvim
set -x FZF_DEFAULT_COMMAND "rg --files-with-matches ."
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_CTRL_R_OPTS --reverse
set -x NODEJS_CHECK_SIGNATURES no

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

# colors
set -U fish_color_autosuggestion brblack --underline
set -U fish_color_cancel red
set -U fish_color_command normal --bold
set -U fish_color_comment brblack
set -U fish_color_end yellow
set -U fish_color_error red --underline
set -U fish_color_escape cyan
set -U fish_color_normal normal
set -U fish_color_operator blue
set -U fish_color_param normal
set -U fish_color_quote green
set -U fish_color_redirection yellow
set -U fish_color_search_match --reverse
set -U fish_pager_color_completion normal --bold --underline
set -U fish_pager_color_description yellow
set -U fish_pager_color_prefix brblack
set -U fish_pager_color_progress yellow

set -Ux FZF_DEFAULT_OPTS "--color=16,fg+:4 --ansi"

function is_apple_silicon
    test (uname -sm) = "Darwin arm64"
end

function is_apple_intel
    test (uname -sm) = "Darwin x86_64"
end

# homebrew path
if is_apple_silicon
    set -x fish_user_paths /opt/homebrew/bin
else if is_apple_intel
    set -x fish_user_paths /usr/local/bin
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

function test_exec
    if type -q $argv[1]
        $argv[1]
    end
end

if is_apple_silicon
    test_source /opt/homebrew/opt/asdf/asdf.fish
    test_source /opt/homebrew/opt/fzf/shell/key-bindings.fish
else if is_apple_intel
    test_source /usr/local/opt/asdf/asdf.fish
    test_source /usr/local/opt/fzf/shell/key-bindings.fish
end

test_source ~/.asdf/asdf.fish
test_exec fzf_key_bindings


###########
# aliases
###########

# allows sudo to use aliases
function sudo
    command sudo -sE $argv
end

# better ls
if type -q exa
    function ls
        command exa -1 $argv
    end
    function la
        command exa -1a $argv
    end
    function ll
        command exa -lg $argv
    end
    function lla
        command exa -lga $argv
    end
end

# work on directories
function cp
    command cp -r $argv
end

function rm
    command rm -rf $argv
end

function mkdir
    command mkdir -p $argv
end

function rsync
    command rsync -aAXvzHE $argv
end

# make CLI rg match fzf
function rg
    command rg --hidden --smart-case --glob !.git $argv
end

# nvim
function vim
    command nvim $argv
end

# git
function g
    command git $argv
end

# mkdir and cd into it
function mkcd
    mkdir -p $argv
    cd $argv
end

# cd .. repeatedly
function up
    cd (eval printf ../%.0s (seq 1 $argv))
end
