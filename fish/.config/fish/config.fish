######
# base
######

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


##########
# commands
##########

# brew
if test -e /opt/homebrew
	set -gx fish_user_paths /opt/homebrew/bin /usr/local/bin
end

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
	starship init fish | source

	# ensure fzf_key_bindings is available for fish_user_key_bindings
	if type -q brew
		source (brew --prefix fzf)/shell/key-bindings.fish
	end

	# ensure bat theme is available
	set -l bat_theme_src ~/.local/share/nvim/lazy/tokyonight.nvim/extras/sublime/tokyonight_night.tmTheme
	set -l bat_theme_dst ~/.config/bat/themes/(basename $bat_theme_src)
	if type -q bat
		if test -e $bat_theme_src; and ! test -e $bat_theme_dst
			mkdir -p (dirname $bat_theme_dst)
			ln -s $bat_theme_src $bat_theme_dst
			bat cache --build
		end
		if test -e $bat_theme_dst
			set -gx BAT_THEME (basename $bat_theme_src .tmTheme)
		end
	end
end
