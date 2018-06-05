###################
# environment setup
###################
setopt PROMPT_SUBST

PROMPT='$(_prompt_left)'
RPROMPT='$(_prompt_right)'

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{magenta})"
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
ZSH_THEME_GIT_PROMPT_BRANCH="%F{magenta}"
ZSH_THEME_GIT_PROMPT_STAGED=" %F{magenta}Δ"
ZSH_THEME_GIT_PROMPT_CONFLICTS=" %F{magenta}X"
ZSH_THEME_GIT_PROMPT_CHANGED=" %F{magenta}!"
ZSH_THEME_GIT_PROMPT_BEHIND=" %F{magenta}↓"
ZSH_THEME_GIT_PROMPT_AHEAD=" %F{magenta}↑"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %F{magenta}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

##################
# helper functions
##################
function _prompt_add() {
  echo -n "${1}"
}

function _prompt_color() {
  _prompt_add "%F{${1}}"
}

function _prompt_reset() {
  _prompt_add "%f"
}

#################
# prompt builders
#################
function _prompt_left() {
  # save exit status so it's not clobbered by successful commands below
  exit_code="$?"
  hostname_prefix=""
  directory_prefix=""

  # if we're not who we logged in as, display the username
  if [ "$USERNAME" != "$LOGNAME" ]; then
    hostname_prefix="at "
    directory_prefix="in "

    if [ "$USER" = "root" ]; then
      _prompt_color red
    else
      _prompt_color green
    fi
    _prompt_add "$USER "
    _prompt_reset
  fi

  # if we're ssh'ed, display the hostname
  if [ -n "$SSH_CONNECTION" ]; then
    directory_prefix="in "

    _prompt_add "$hostname_prefix"

    _prompt_color yellow
    _prompt_add "$(hostname)"
    _prompt_reset
  fi

  # print PWD
  _prompt_add "$directory_prefix"
  _prompt_color blue
  _prompt_add "%~ "
  _prompt_reset

  # prompt char - red if previous command failed
  if [ $exit_code -ne 0 ]; then
    _prompt_color red
  fi

  _prompt_add "> "
  _prompt_reset
}

_prompt_right() {
  _prompt_color magenta
  _prompt_add "$(git_super_status)"
  _prompt_reset
}
