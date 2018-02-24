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
if test -e ~/.pyenv
  status --is-interactive; and source (pyenv init -|psub)
  status --is-interactive; and source (pyenv virtualenv-init -|psub)
end

# colorized manpages
set -x LESS_TERMCAP_mb (printf "\033[01;31m")
set -x LESS_TERMCAP_md (printf "\033[01;31m")
set -x LESS_TERMCAP_me (printf "\033[0m")
set -x LESS_TERMCAP_se (printf "\033[0m")
set -x LESS_TERMCAP_so (printf "\033[01;44;33m")
set -x LESS_TERMCAP_ue (printf "\033[0m")
set -x LESS_TERMCAP_us (printf "\033[01;32m")
