# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=vim
export PATH=$PATH:~/dotfiles/scripts
export GOPATH=~/go

#masterpassword settings
export MP_FULLNAME=mpcsh
export MP_SITETYPE=maximum

#grab aliases
source ~/.bash_aliases

#prompt
source /usr/share/git/git-prompt.sh

function prompt() {
	BRANCH=$(__git_ps1 %s)
	[[ $BRANCH ]] && echo -e " on $(tput setaf 4)$BRANCH$(tput sgr0)" || echo -e ''
}

function prompt_git() {
	local s='';
	local branchName='';

	# Check if the current directory is in a Git repository.
	if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

		# check if the current directory is in .git before running git checks
		if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

			# Ensure the index is up to date.
			git update-index --really-refresh -q &>/dev/null;

			# Check for uncommitted changes in the index.
			if ! $(git diff --quiet --ignore-submodules --cached); then
				s+='+';
			fi;

			# Check for unstaged changes.
			if ! $(git diff-files --quiet --ignore-submodules --); then
				s+='!';
			fi;

			# Check for untracked files.
			if [ -n "$(git ls-files --others --exclude-standard)" ]; then
				s+='?';
			fi;

			# Check for stashed files.
			if $(git rev-parse --verify refs/stash &>/dev/null); then
				s+='$';
			fi;

		fi;

		# Get the short symbolic ref.
		# If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
		# Otherwise, just give up.
		branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
			git rev-parse --short HEAD 2> /dev/null || \
			echo '(unknown)')";

		[ -n "${s}" ] && s=" [${s}]";

		echo -e "${branchName}${s}";
	else
		return;
	fi;
}

PS1='$(tput setaf 1)\u$(tput sgr0) at $(tput setaf 2)\h$(tput sgr0) in $(tput setaf 3)\W$(tput sgr0)$(prompt)\n» '

#display startx prompt on Antenora and Skynet when logging in to a tty
if [[ -z $DISPLAY && $HOSTNAME == "Antenora" || -z $DISPLAY && $HOSTNAME == "Skynet" || -z $DISPLAY && $HOSTNAME == "Paradisio" ]]; then
	fortune calvin | cowsay
	echo "startx?"
	select yn in "yes" "no"; do
		case $yn in
			yes ) exec startx;;
			no ) break;;
		esac
	done
fi
