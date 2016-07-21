#allows sudo to use aliases
alias sudo='sudo '

#better ls
alias ls='ls -lhF --color=auto'
alias la='ls -lhFA --color=auto'

#colors
alias grep='grep --color=auto'

#symlink by default
alias ln='ln -sf'

#work on directories
alias cp='cp -r'
alias rm='rm -rf'

#shred and delete
alias shred='shred --remove'

#refresh htop faster
alias htop='nice htop -d 5'

#no ipv6
alias ping='ping -4'

#typed racket
alias racket='racket -I typed/racket'

#custom neofetch colors
alias neofetch='neofetch --colors 1 1 1 1 --ascii_colors 6 1'

#clone terminal
alias ct='urxvt -cd $(pwd) & disown &> /dev/null'

#run previous command as root
alias fuck='sudo $(history -p \!\!)'

#mkdir and cd into it
function mkcd() {
	mkdir -p "$1"
	cd "$1"
}

#cd .. repeatedly
function up() {
	cd $(eval printf ../%.0s {1..$1})
}
