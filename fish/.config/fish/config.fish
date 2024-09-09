######
# base
######

# hide the welcome message
set fish_greeting ""

# environment variables
set -gx ASDF_NPM_DEFAULT_PACKAGES_FILE "$HOME/.config/asdf/nodejs-default-packages"
set -gx ASDF_PYTHON_DEFAULT_PACKAGES_FILE "$HOME/.config/asdf/python-default-packages"
set -gx EDITOR nvim
set -l fzf_catppuccin_mocha "--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
set -gx FZF_DEFAULT_OPTS "$fzf_catppuccin_mocha --layout=reverse --height=50% --preview-window=wrap --marker='*'"
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
set -gx GROFF_NO_SGR 1

# colors
set -g fish_color_normal normal
set -g fish_color_command normal --bold
# set -g fish_color_keyword
set -g fish_color_quote green
set -g fish_color_redirection yellow
set -g fish_color_end yellow
set -g fish_color_error red --underline
set -g fish_color_param normal
# set -g fish_color_valid_path
# set -g fish_color_option
set -g fish_color_comment brblack
# set -g fish_color_selection
set -g fish_color_operator blue
set -g fish_color_escape cyan
set -g fish_color_autosuggestion brblack --underline
# set -g fish_color_cwd
# set -g fish_color_cwd_root
# set -g fish_color_user
# set -g fish_color_host
# set -g fish_color_host_remote
# set -g fish_color_status
set -g fish_color_cancel red
set -g fish_color_search_match --reverse
# set -g fish_color_history_current

set -g fish_pager_color_progress yellow
# fish_pager_color_background
set -g fish_pager_color_prefix brblack
set -g fish_pager_color_completion normal --bold --underline
set -g fish_pager_color_description yellow
# fish_pager_color_selected_background
# fish_pager_color_selected_prefix
# fish_pager_color_selected_completion
# fish_pager_color_selected_description
# fish_pager_color_secondary_background
# fish_pager_color_secondary_prefix
# fish_pager_color_secondary_completion
# fish_pager_color_secondary_description



##################
# package managers
##################

# brew
if test -e /opt/homebrew/bin/brew
	eval (/opt/homebrew/bin/brew shellenv)
	set -gx HOMEBREW_NO_ENV_HINTS true
end


##########
# commands
##########

# asdf
if type -q brew; and brew --prefix --installed asdf > /dev/null
	source (brew --prefix asdf)/libexec/asdf.fish
end

# direnv
if type -q direnv
	direnv hook fish | source
end

# pixlet
if type -q pixlet
	pixlet completion fish | source
end


###########
# aliases
###########

function cp --wraps cp --description "cp recursively"
	command cp -R $argv
end

function g --wraps git
	command git $argv
end

if type -q eza
	function ls --wraps eza
		command eza -1 --classify $argv
	end
	function la --wraps eza
		command eza -1a --classify $argv
	end
	function ll --wraps eza
		command eza --git -lg --classify $argv
	end
	function lla --wraps eza
		command eza --git -lga --classify $argv
	end
else
	function ls --wraps ls
		command ls -1F $argv
	end
	function la --wraps ls
		command ls -1FA $argv
	end
	function ll --wraps ls
		command ls -lFh $argv
	end
	function lla --wraps ls
		command ls -lFhA $argv
	end
end

function mkcd --wraps cd --description "mkdir and cd into it"
	mkdir -p $argv
	cd $argv
end

function mkdir --wraps mkdir
	command mkdir -p $argv
end

function rg --wraps rg --description "TODO"
	command rg --hidden --smart-case --glob !.git $argv
end

function rm --wraps rm
	command rm -rf $argv
end

function rsync --wraps rsync --description "TODO"
	command rsync -avz $argv
end

function soulver --wraps soulver --description "enable up arrow in soulver"
	rlwrap command soulver $argv
end

function sudo --wraps sudo --description "allows sudo to use aliases"
	command sudo -sE $argv
end

function vim --wraps nvim
	command nvim $argv
end

function up --description "cd .. repeatedly"
	cd (eval printf ../%.0s (seq 1 $argv))
end


#########################
# interactive-only config
#########################

if status --is-interactive
	# set up prompt
	if type -q starship
		starship init fish | source
	end

	if type -q bat
		set -gx BAT_THEME "Catppuccin Mocha"
	end

	if type -q zoxide
		zoxide init fish | source
	end

	if type -q fzf_configure_bindings
		fzf_configure_bindings --directory=\ct --git_log=\cg --git_status= --history=\cr --processes=\cp --variables=\cv
		set fzf_fd_opts --hidden --exclude .git/ -t f
		set fzf_history_opts --preview="" --with-nth=4..
	end

	set -l HB_CNF_HANDLER (brew --repository)"/Library/Taps/homebrew/homebrew-command-not-found/handler.fish"
	if test -f $HB_CNF_HANDLER
		 source $HB_CNF_HANDLER
	end
end
