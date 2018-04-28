# clear default aliases
unalias -m '*'

# thefuck
if type thefuck >> /dev/null; then
  eval $(thefuck --alias)
fi

# allows sudo to use aliases
alias sudo="sudo -sE "

# better ls
alias ls="ls -lhF --color=auto"
alias la="ls -lhFA --color=auto"

# symlink by default
alias ln="ln -s"

# work on directories
alias cp="cp -r"
alias rm="rm -rf"
alias mkdir="mkdir -p"

# make CLI rg match fzf
alias rg="rg --hidden --smart-case --glob !.git $argv"

# nvim
alias vim="nvim"

# rsync options
alias rsync="rsync -aAXvzHE --progress -h"

# typed racket
alias racket="racket -I typed/racket"

# make SML REPL understand up-arrow
alias sml="rlwrap sml -Cprint.depth=1000"

# mkdir and cd into it
function mkcd() {
  mkdir -p $argv
  cd $argv
}

# cd .. repeatedly
function up() {
  cd $(eval printf ../%.0s $(seq 1 $argv))
}
