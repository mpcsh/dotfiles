###################
# environment setup
###################
setopt PROMPT_SUBST

PROMPT='$(_prompt_left)'
RPROMPT='$(_prompt_right)'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{magenta}("
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

git_super_status() {
  precmd_update_git_vars
  if [ -n "$__CURRENT_GIT_STATUS" ]; then
    STATUS="${ZSH_THEME_GIT_PROMPT_PREFIX}${ZSH_THEME_GIT_PROMPT_BRANCH}${GIT_BRANCH}"
    if [ "$GIT_BEHIND" -ne "0" ]; then
      STATUS="${STATUS}${ZSH_THEME_GIT_PROMPT_BEHIND}${GIT_BEHIND}"
    fi
    if [ "$GIT_AHEAD" -ne "0" ]; then
      STATUS="${STATUS}${ZSH_THEME_GIT_PROMPT_AHEAD}${GIT_AHEAD}"
    fi
    STATUS="${STATUS}${ZSH_THEME_GIT_PROMPT_SEPARATOR}"
    if [ "$GIT_STAGED" -ne "0" ]; then
      STATUS="${STATUS}${ZSH_THEME_GIT_PROMPT_STAGED}${GIT_STAGED}"
    fi
    if [ "$GIT_CONFLICTS" -ne "0" ]; then
      STATUS="${STATUS}${ZSH_THEME_GIT_PROMPT_CONFLICTS}${GIT_CONFLICTS}"
    fi
    if [ "$GIT_CHANGED" -ne "0" ]; then
      STATUS="${STATUS}${ZSH_THEME_GIT_PROMPT_CHANGED}${GIT_CHANGED}"
    fi
    if [ "$GIT_UNTRACKED" -ne "0" ]; then
      STATUS="${STATUS}${ZSH_THEME_GIT_PROMPT_UNTRACKED}${GIT_UNTRACKED}"
    fi
    if [ "$GIT_CHANGED" -eq "0" ] && [ "$GIT_CONFLICTS" -eq "0" ] && [ "$GIT_STAGED" -eq "0" ] && [ "$GIT_UNTRACKED" -eq "0" ]; then
      STATUS="${STATUS}${ZSH_THEME_GIT_PROMPT_CLEAN}"
    fi
    STATUS="${STATUS}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
    echo "${STATUS}"
  fi
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
  if [ "$USER" != "mpcsh" ] && [ "$USER" != "njw" ]; then
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
  _prompt_add "» "
  _prompt_reset
}

_prompt_right() {
  _prompt_color magenta
  _prompt_add "$(git_super_status)"
  _prompt_reset
}
