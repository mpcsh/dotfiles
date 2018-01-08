# clear aliases
unalias -m '*'

# thefuck
eval $(thefuck --alias)

# z
source /usr/local/etc/profile.d/z.sh

# allows sudo to use aliases
alias sudo='sudo '


# better ls
alias ls='ls -lhFG'
alias la='ls -lhFGA'


# symlink by default
alias ln='ln -s'

# work on directories
alias cp='cp -r'
alias rm='rm -rf'
alias mkdir='mkdir -p'

# nvim
alias vim='nvim'

# rsync sane defaults
alias rcp='rsync -avzHE --progress -h'

# mkdir then cd
function mkcd() {
  mkdir -p "$1"
  cd "$1"
}

# cd .. repeatedly
function __up_aux() {
  if (( $1 == 0 )); then
    return
  else
    cd ..
    __up_aux $(( $1 - 1 ))
  fi
}

function up() {
  if [ $# -eq 0 ]; then
    __up_aux 1
  else
    __up_aux "$1"
  fi
}
