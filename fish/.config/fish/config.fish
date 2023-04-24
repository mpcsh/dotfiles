# hide the welcome message
set fish_greeting ""

# environment variables
set -gx ASDF_NPM_DEFAULT_PACKAGES_FILE "$HOME/.config/asdf/npm-default-packages"
set -gx ASDF_PYTHON_DEFAULT_PACKAGES_FILE "$HOME/.config/asdf/python-default-packages"
set -gx EDITOR nvim
set -gx FZF_DEFAULT_COMMAND "rg --files-with-matches ."
set -gx FZF_DEFAULT_OPTS "--color=16,fg+:4 --ansi"
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_CTRL_R_OPTS --reverse
set -gx NODEJS_CHECK_SIGNATURES no
set -gx TERM xterm-256color

# colorized manpages
set -gx LESS_TERMCAP_mb (printf "\033[01;31m")
set -gx LESS_TERMCAP_md (printf "\033[01;31m")
set -gx LESS_TERMCAP_me (printf "\033[0m")
set -gx LESS_TERMCAP_se (printf "\033[0m")
set -gx LESS_TERMCAP_so (printf "\033[01;44;33m")
set -gx LESS_TERMCAP_ue (printf "\033[0m")
set -gx LESS_TERMCAP_us (printf "\033[01;32m")

# colors
set -g fish_color_autosuggestion brblack --underline
set -g fish_color_cancel red
set -g fish_color_command normal --bold
set -g fish_color_comment brblack
set -g fish_color_end yellow
set -g fish_color_error red --underline
set -g fish_color_escape cyan
set -g fish_color_normal normal
set -g fish_color_operator blue
set -g fish_color_param normal
set -g fish_color_quote green
set -g fish_color_redirection yellow
set -g fish_color_search_match --reverse
set -g fish_pager_color_completion normal --bold --underline
set -g fish_pager_color_description yellow
set -g fish_pager_color_prefix brblack
set -g fish_pager_color_progress yellow

# homebrew path
set -gx fish_user_paths /opt/homebrew/bin /usr/local/bin

# bail if we don't need to set up the prompt
if ! status --is-interactive
    exit
end

# prompt
starship init fish | source

# asdf
source (brew --prefix asdf)/libexec/asdf.fish

# fzf
source (brew --prefix fzf)/shell/key-bindings.fish
fzf_key_bindings

# direnv
direnv hook fish | source

# pixlet
if type -q pixlet
    pixlet completion fish | source
end


###########
# aliases
###########

# allows sudo to use aliases
function sudo --wraps sudo
    command sudo -sE $argv
end

# better ls
if type -q exa
    function ls --wraps exa
        command exa -1 $argv
    end
    function la --wraps exa
        command exa -1a $argv
    end
    function ll --wraps exa
        command exa -lg $argv
    end
    function lla --wraps exa
        command exa -lga $argv
    end
end

# work on directories
function cp --wraps cp
    command cp -r $argv
end

function rm --wraps rm
    command rm -rf $argv
end

function mkdir --wraps mkdir
    command mkdir -p $argv
end

function rsync --wraps rsync
    command rsync -avz $argv
end

# make CLI rg match fzf
function rg --wraps rg
    command rg --hidden --smart-case --glob !.git $argv
end

# nvim
function vim --wraps nvim
    command nvim $argv
end

# git
function g --wraps git
    command git $argv
end

# mkdir and cd into it
function mkcd --wraps mkdir
    mkdir -p $argv
    cd $argv
end

# cd .. repeatedly
function up
    cd (eval printf ../%.0s (seq 1 $argv))
end
