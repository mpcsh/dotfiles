######
# base
######

# hide the welcome message
set fish_greeting ""

# environment variables
set -gx EDITOR nvim
set -l fzf_catppuccin_mocha "--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
set -gx FZF_DEFAULT_OPTS "$fzf_catppuccin_mocha --layout=reverse --height=50% --preview-window=wrap --marker='*'"
set -gx MANPAGER "less -i"
if test (uname -o) = "Darwin"
	# mise is automagically activated when using brew and fish: https://mise.jdx.dev/getting-started.html
	# disable this behavior to control path addition sequencing
	set -gx MISE_FISH_AUTO_ACTIVATE 0
end
set -gx NODEJS_CHECK_SIGNATURES no
if test (uname -om) = "Darwin arm64"
	set -gx TEALDEER_CONFIG_DIR "$HOME/.config/tealdeer"
end

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

# nix
if test -e ~/.nix-profile
	fish_add_path -g ~/.nix-profile/bin
end


##########
# commands
##########

# custom scripts
if test -e ~/.local/bin
	fish_add_path -g ~/.local/bin
end

# pixlet
if type -q pixlet
	pixlet completion fish | source
end


###########
# aliases
###########

function cp --wraps cp
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

function mkcd --wraps cd
	mkdir -p $argv
	cd $argv
end

function mkdir --wraps mkdir
	command mkdir -p $argv
end

function rg --wraps rg
	command rg --hidden --smart-case --glob !.git $argv
end

function rm --wraps rm
	command rm -rf $argv
end

function rsync --wraps rsync
	command rsync --compress --recursive --update --progress --partial --human-readable --verbose $argv
end

function soulver --wraps soulver
	rlwrap command soulver $argv
end

function sudo --wraps sudo
	command sudo -sE $argv
end

function vim --wraps nvim
	command nvim $argv
end

function up
	cd (eval printf ../%.0s (seq 1 $argv))
end


#########################
# interactive-only config
#########################

if status --is-interactive
	if type -q starship
		starship init fish | source
	end

	if type -q fzf_configure_bindings
		fzf_configure_bindings --directory=\ct --git_log=\cg --git_status=\cs --history= --processes=\cp --variables=\cv
		set fzf_fd_opts --hidden --exclude .git/ -t f
		set fzf_history_opts --preview="" --with-nth=4..
	end

	if type -q atuin
		atuin init fish --disable-up-arrow | source
	end

	if type -q brew
		set -l HB_CNF_HANDLER (brew --repository)"/Library/Taps/homebrew/homebrew-command-not-found/handler.fish"
		if test -f $HB_CNF_HANDLER
			 source $HB_CNF_HANDLER
		end
	end

	if type -q bat
		set -gx BAT_THEME "Catppuccin Mocha"
	end

	if type -q jj
		env COMPLETE=fish jj | source
	end

	if type -q mise
		mise activate fish | source
	end

	if type -q zoxide
		zoxide init fish | source
	end
end
