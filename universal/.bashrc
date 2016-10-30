# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# env vars
export EDITOR=nvim
export PATH=$PATH:~/dotfiles/scripts
export GOPATH=~/.go
export MP_FULLNAME=mpcsh
export MP_SITETYPE=maximum
export TERM=xterm
export vim=nvim

# grab aliases
source ~/.bash_aliases

# dircolors
eval $(dircolors ~/.colors/dircolors.ansi-dark)

# z.sh
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# prompt
function prompt_git() {
	local s='';
	local branchName='';

	# Check if the current directory is in a Git repository.
	if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

		# check if the current directory is in .git before running git checks
		if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

			if [[ -O "$(git rev-parse --show-toplevel)/.git/index" ]]; then
				git update-index --really-refresh -q &> /dev/null;
			fi;

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

		echo -e " on $(tput setaf 5)${branchName}${s}$(tput sgr0)";
	else
		return;
	fi;
}

PS1='$(tput setaf 2)\u$(tput sgr0) at $(tput setaf 3)\h$(tput sgr0) in $(tput setaf 4)\W$(tput sgr0)$(prompt_git)\n→ '

# dem perms!
[[ $HOSTNAME == "xyz" ]] && umask 022 || umask 077

# display startx prompt on huascaran and annapurna when logging in to a tty
if [[ -z $DISPLAY && $HOSTNAME == "huascaran" || -z $DISPLAY && $HOSTNAME == "annapurna" || -z $DISPLAY && $HOSTNAME == "eiger" ]]; then
	fortune calvin | cowsay
	echo "startx?"
	select yn in "yes" "no"; do
		case $yn in
			yes ) exec startx;;
			no ) break;;
		esac
	done
fi
