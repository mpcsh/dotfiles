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
function prompt() {
	PS1='\u at \h in \W '
	BRANCH=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	[[ $BRANCH ]] && 
}

PS1="$(prompt)"

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
