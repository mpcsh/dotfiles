###################
# environment setup
###################
setopt PROMPT_SUBST

PROMPT='$(_prompt_left)'
RPROMPT='$(_prompt_right)'
PS2='> '

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

function _vcs_status() {
  # ensure we're in a git repository
  if ! git rev-parse --is-inside-work-tree &> /dev/null; then
    return
  fi

  # ensure we're not in the .git directory
  if [ $(git rev-parse --is-inside-git-dir 2> /dev/null) = "true" ]; then
    return
  fi

  # update the index, but only if this user owns this repo
  if test -O $(git rev-parse --show-toplevel)/.git/index; then
    git update-index --really-refresh -q &> /dev/null
  fi

  # get the current status and branch name
  local _git_status=$(git status --porcelain=v1 --branch)
  local remote_info=$(echo $_git_status | head -n 1 | cut -d ' ' -f 2)
  local git_status=$(echo $_git_status | tail -n +2)
  local branch_name=$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
                      git rev-parse --short HEAD 2> /dev/null || \
                      echo '(unknown)')

  # start building up the status string
  local ret="($branch_name"

  # get remote tracking status
  if echo $remote_info | grep '\.\.\.' &> /dev/null; then
    local count=$(git rev-list --count --left-right $remote_info)
    local ahead=$(echo $count | cut -f 1)
    local behind=$(echo $count | cut -f 2)
    if (( $ahead > 0 )); then
      ret+=" ↑$ahead"
    fi
    if (( $behind > 0 )); then
      ret+=" ↓$behind"
    fi
  fi

  # check for staged changes
  local num_changed=$(echo $git_status | grep "M  " | wc -l | xargs)
  local num_new=$(echo $git_status | grep "A  " | wc -l | xargs)
  local num_removed=$(echo $git_status | grep "D  " | wc -l | xargs)
  local num_staged=$(( $num_changed + $num_new + $num_removed ))
  if (( $num_staged > 0 )); then
    ret+=" Δ$num_staged"
  fi

  # check for unstaged changes
  local num_unstaged=$(echo $git_status | grep " M " | wc -l | xargs)
  if (( $num_unstaged > 0 )); then
    ret+=" !$num_unstaged"
  fi

  # check for unknown files
  local num_unknown=$(echo $git_status | grep "?? " | wc -l | xargs)
  if (( $num_unknown > 0 )); then
    ret+=" ?$num_unknown"
  fi

  # check for deleted files
  local num_deleted=$(echo $git_status | grep " D " | wc -l | xargs)
  if (( $num_deleted > 0 )); then
    ret+=" X$num_deleted"
  fi

  ret+=")"

  echo -n $ret
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
  _prompt_add "$(_vcs_status)"
  _prompt_reset
}
