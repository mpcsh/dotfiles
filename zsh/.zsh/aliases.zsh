# clear default aliases
unalias -m '*'

# thefuck
if type thefuck &> /dev/null; then
  eval $(thefuck --alias)
fi

# allows sudo to use aliases
alias sudo="sudo -sE "

# better ls
if type exa &> /dev/null; then
  alias ls="exa -1"
  alias la="exa -1a"
  alias ll="exa -l"
  alias lla="exa -la"
else
  alias ls="ls -1hF --color=auto"
  alias la="ls -1hFA --color=auto"
  alias ll="ls -lhF --color=auto"
  alias lla="ls -lhFA --color=auto"
fi

# nvim
if type nvim &> /dev/null; then
  alias vim="nvim"
fi

# symlink by default
alias ln="ln -s"

# work on directories
alias cp="cp -r"
alias rm="rm -rf"
alias mkdir="mkdir -p"

# make CLI rg match fzf
if type rg &> /dev/null; then
  alias rg="rg --hidden --smart-case --glob !.git"
fi

# rsync options
if type rsync &> /dev/null; then
  alias rsync="rsync -aAXvzHE --progress -h"
fi

# typed racket
if type racket &> /dev/null; then
  alias racket="racket -I typed/racket"
fi

# make SML REPL understand up-arrow
if type rlwrap &> /dev/null && type sml &> /dev/null; then
  alias sml="rlwrap sml -Cprint.depth=1000"
fi

# don't ask to edit PKGBUILDs, import PGP keys, etc
if type yay &> /dev/null; then
  alias yay="yay --noconfirm"
fi

# xclip into clipboard by default
if type xclip &> /dev/null; then
  alias xclip="xclip -selection clipboard"
fi

# flash ergodox firmware
if type teensy-loader-cli &> /dev/null; then
  alias ergodox="teensy-loader-cli -mmcu=atmega32u4 -w -v"
fi

# mkdir and cd into it
function mkcd() {
  mkdir -p $argv
  cd $argv
}

# cd .. repeatedly
function up() {
  cd $(eval printf ../%.0s $(seq 1 $argv))
}
