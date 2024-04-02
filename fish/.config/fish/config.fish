######
# base
######

# hide the welcome message
set fish_greeting ""

# environment variables
set -gx ASDF_NPM_DEFAULT_PACKAGES_FILE "$HOME/.config/asdf/nodejs-default-packages"
set -gx ASDF_PYTHON_DEFAULT_PACKAGES_FILE "$HOME/.config/asdf/python-default-packages"
set -gx EDITOR nvim
set -gx FZF_DEFAULT_COMMAND "rg --files-with-matches ."
# set -gx FZF_DEFAULT_OPTS "--color=16,fg+:4 --ansi"
set -gx FZF_DEFAULT_OPTS "--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
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
set -gx GROFF_NO_SGR 1

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


##################
# package managers
##################

# brew
if test -e /opt/homebrew
	fish_add_path --prepend --global /opt/homebrew/bin /usr/local/bin
end

# nix
set -l nix_daemon /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
if ! command -q nix; and test -e $nix_daemon
	source $nix_daemon
end


##########
# commands
##########

# asdf
if type -q brew
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

	# ensure fzf_key_bindings is available for fish_user_key_bindings
	if type -q brew
		source (brew --prefix fzf)/shell/key-bindings.fish
	end

	if type -q bat
		set -gx BAT_THEME "Catppuccin Mocha"
	end

	if type -q zoxide
		zoxide init fish | source
	end
end
