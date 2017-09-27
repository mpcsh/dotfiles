# clear default aliases
unalias -m '*'

# allows sudo to use aliases
alias sudo='sudo '

# better ls
alias ls='ls -lhFG'
alias la='ls -lhFGA'

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
alias ack='ack --smart-case --type-set=tags:is:tags --notags --ignore-file=match:.bundle.js --ignore-dir=node_modules --ignore-dir=vendor --ignore-dir=proc --ignore-dir=sys --ignore-dir=.peru --ignore-dir=chromium --ignore-dir=.npm --color-match=green'

# nvim
alias vim='nvim'

# rsync options
alias rsync='rsync -aAXvzHE'

# mkdir and cd into it
function mkcd() {
	mkdir -p "$1"
	cd "$1"
}

# cd .. repeatedly
function up() {
	cd $(eval printf ../%.0s {1..$1})
}
