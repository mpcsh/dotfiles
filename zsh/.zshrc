# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# clear the default nixos zsh prompt
prompt off

# prompt configuration
ZSH_THEME="spaceship/spaceship"
SPACESHIP_PROMPT_ORDER=(
	user
	host
	dir
	git
	node
	golang
	rust
	haskell
	venv
	exec_time
	jobs
	exit_code
	char
)
SPACESHIP_PROMPT_ADD_NEWLINE=false # no newline before prompt
SPACESHIP_BATTERY_SHOW=false
SPACESHIP_EXEC_TIME_ELAPSED=30 # only show exec time if it's longer than 30s
SPACESHIP_PROMPT_SYMBOL="»"
SPACESHIP_DIR_TRUNC=0
SPACESHIP_GIT_SYMBOL="\0" # don't show branch symbol before branch name
SPACESHIP_GIT_STATUS_COLOR=magenta
SPACESHIP_GIT_STATUS_PREFIX="("
SPACESHIP_GIT_STATUS_SUFFIX=")"
SPACESHIP_GIT_STATUS_UNTRACKED="?"
SPACESHIP_GIT_STATUS_ADDED="+"
SPACESHIP_GIT_STATUS_MODIFIED="!"
SPACESHIP_GIT_STATUS_RENAMED="»"
SPACESHIP_GIT_STATUS_DELETED="X"
SPACESHIP_GIT_STATUS_STASHED="$"
SPACESHIP_GIT_STATUS_UNMERGED="="
SPACESHIP_GIT_STATUS_AHEAD="↑"
SPACESHIP_GIT_STATUS_BEHIND="↓"
SPACESHIP_GIT_STATUS_DIVERGED="↕"

# for ssh compatibility
export TERM=xterm-256color

# disable oh-my-zsh's auto updater
DISABLE_AUTO_UPDATE="true"

# enable command autocorrection
ENABLE_CORRECTION="true"

# load oh-my-zsh plugins
plugins=(git zsh-syntax-highlighting)

# load oh-my-zsh
source $ZSH/oh-my-zsh.sh
