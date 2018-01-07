# source prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#############
# environment
#############

# permissions
umask 077

# editor
export EDITOR='nvim'
export VISUAL="$EDITOR"
export PAGER='less'

# environment variables
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
export FZF_DEFAULT_OPTS='--color=16,fg+:4 --ansi'
export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git -l -g ""'
export FZF_CTRL_R_OPTS='--reverse'

# paths
export GOPATH='~/.go'
path=(
  /usr/local/sbin
  $GOPATH/bin
  $path
)


#########
# aliases
#########

# clear aliases
unalias -m '*'

# thefuck
eval $(thefuck --alias --enable-experimental-instant-mode)

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
  mkdir -p $1
  cd $1
}

# cd .. repeatedly
function up() {
  cd $(eval printf ../%.0s (seq 1 $1))
}

# compile the completion dump to increase startup speed
zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
  zcompile "$zcompdump"
fi
