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

# run previous command as root
alias fuck='sudo $(history -p \!\!) '

# ack
alias ack='ack --smart-case --type-set=tags:is:tags --notags --ignore-file=match:.bundle.js --ignore-dir=node_modules --ignore-dir=vendor --ignore-dir=proc --ignore-dir=sys --ignore-dir=.peru --ignore-dir=chromium --ignore-dir=.npm --color-match=green'

# nvim
[[ $HOSTNAME != "magneton" && $HOSTNAME != "doduo" ]] && alias vim='nvim'

# rsync options
alias rsync='rsync -aAXvzHE'

# colored iproute2
alias ip='ip -c'

# clipboard
alias xclip='xclip -selection clipboard'

# screencasting
function screencast() {
	ffmpeg -f x11grab -video_size 2560x1440 -framerate 30 -i $DISPLAY -f pulse -ac 2 -i default "$1"
}

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
