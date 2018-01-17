# don't show annoying welcome message
set fish_greeting ""

# environment variables
set -gx GOPATH ~/.go
set -gx PYENV_ROOT ~/.pyenv
set -gx fish_user_paths $GOPATH/bin /usr/local/sbin $PYENV_ROOT/shims $PYENV_ROOT/bin
set -gx EDITOR nvim
set -gx FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git -l -g ""'
set -gx FZF_DEFAULT_OPTS '--color=16,fg+:4 --ansi'
set -gx FZF_CTRL_T_COMMAND 'ag --hidden --ignore .git -l -g ""'
set -gx FZF_CTRL_R_OPTS '--reverse'
set -gx fish_prompt_pwd_dir_length 0

# permissions
umask 077

# pyenv
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)
