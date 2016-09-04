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

# no ipv6
alias ping='ping -4'

# typed racket
alias racket='racket -I typed/racket'

# custom neofetch colors
alias neofetch='neofetch --colors 1 1 1 1 --ascii_colors 6 1'

# run previous command as root
alias fuck='sudo $(history -p \!\!)'

# nvim
alias vim='nvim'

# clone terminal
alias ct='termite -d $PWD &> /dev/null & disown'

# clipboard
alias xclip='xclip -selection clipboard'

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
