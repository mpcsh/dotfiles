# allows sudo to use aliases
alias sudo='sudo '

# better ls
alias ls='ls -lhF --color=auto'
alias la='ls -lhFA --color=auto'

# colors
alias grep='grep --color=auto'

# symlink by default
alias ln='ln -sf'

# work on directories
alias cp='cp -r'
alias rm='rm -rf'
alias mkdir='mkdir -p'

# shred and delete
alias shred='shred --remove'

# refresh htop faster
alias htop='nice htop -d 5'

# typed racket
alias racket='racket -I typed/racket'

# run previous command as root
alias fuck='sudo $(history -p \!\!) '

# astyle
alias astyle='astyle --style=stroustrup'

# nvim
[[ $HOSTNAME != "magneton" && $HOSTNAME != "doduo" ]] && alias vim='nvim'

# rsync options
alias rsync='rsync -aAXvzHE'

# clone terminal
alias ct='termite -d $PWD &> /dev/null & disown'

# colored iproute2
alias ip='ip -c'

# clipboard
alias xclip='xclip -selection clipboard'

# weather
alias weather='curl wttr.in'

# moon
alias moon='curl wttr.in/Moon'

# set X background
function setbg() {
	[[ $# -eq 0 ]] && : || cp $1 ~/.wallpaper
	feh --no-fehbg --bg-fill ~/.wallpaper
}

# mkdir and cd into it
function mkcd() {
	mkdir -p "$1"
	cd "$1"
}

# cd .. repeatedly
function up() {
	cd $(eval printf ../%.0s {1..$1})
}

# find the WID with the given WNAME
function find_wids() {
	for wid in $(lsw); do
		wname=$(wname $wid)
		if (( $# == 0)); then
			echo "$wid $wname"
		elif [[ $wname =~ "$1" ]]; then
			echo $wid
		fi
	done
}

# playgrounds
function playground() {
	if [[ $# != 1 ]]; then
		echo "must supply either c, rust, iced, or python"
	fi
	dir="$(mktemp -d)"
	mkdir -p "$dir/playground"
	cd "$dir/playground"
	if [[ $1 == "c" ]]; then
		cat << EOF > test.c
#include <stdio.h>

int main() {

	return 0;
}
EOF
		cat << EOF > Makefile
.PHONY: default clean

default:
	gcc -Wall -g -o out.test test.c

clean:
	rm -f out.*
EOF
		vim test.c
	fi
}
