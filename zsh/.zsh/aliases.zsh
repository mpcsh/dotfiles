# clear default aliases
unalias -m '*'

# allows sudo to use aliases
alias sudo='sudo '

# better ls
alias ls='ls -lhF --color=auto'
alias la='ls -lhFA --color=auto'

# symlink by default
alias ln='ln -sf'

# work on directories
alias cp='cp -r'
alias rm='rm -rf'
alias mkdir='mkdir -p'

# shred and delete
alias shred='shred --remove'

# don't let htop count itself
alias htop='nice htop'

# typed racket
alias racket='racket -I typed/racket'

# ack
alias ack='ack --smart-case --color-match=green'

# nvim
alias vim='nvim'

# rsync options
alias rsync='rsync -avzHE'

# mkdir and cd into it
function mkcd() {
	mkdir -p "$1"
	cd "$1"
}

# cd .. repeatedly
function up() {
	cd $(eval printf ../%.0s {1..$1})
}
