# don't show annoying welcome message
set fish_greeting ""

# environment variables
set -x GOPATH ~/.go
set -x PYENV_ROOT ~/.pyenv
set -x fish_user_paths $GOPATH/bin /usr/local/sbin $PYENV_ROOT/shims $PYENV_ROOT/bin
set -x EDITOR nvim
set -x FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git -l -g ""'
set -x FZF_DEFAULT_OPTS '--color=16,fg+:4 --ansi'
set -x FZF_CTRL_T_COMMAND 'ag --hidden --ignore .git -l -g ""'
set -x FZF_CTRL_R_OPTS '--reverse'

# permissions
umask 077

# pyenv
status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)
