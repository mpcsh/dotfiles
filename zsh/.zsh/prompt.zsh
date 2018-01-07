# prompt function
function __set_prompt() {
  exit_code=$?
  hostname_prefix=""
  directory_prefix=""

  # bold prompts
  echo -n "%B"

  # if we're not mpcsh, display the username
  if [[ $USER != "mpcsh" ]]; then
    hostname_prefix="at "

    if [[ $USER == "root" ]]; then
      echo -n "%F{red}"
    else
      echo -n "%F{green}"
    fi

    echo -n "%n%F "
  fi

  # if we're ssh'ed, display the hostname
  if [[ -v $SSH_CONNECTION || -v $SSH_CLIENT || -v $SSH_TTY ]]; then
    directory_prefix="in "
    echo -n "$hostname_prefix%F{yellow}%M%f "
  fi

  # print PWD
  echo -n "$directory_prefix%F{blue}%~%f "

  # prompt char - red if previous command failed
  if [ $exit_code -ne 0 ]; then
    echo -n "%F{red}»%f "
  else
    echo -n "» "
  fi

  # unset bold
  echo -n "%b"
}

# rprompt function
function __set_rprompt() {
  # bold prompts
  echo -n "%B"

  if [[ "$(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}")" == '0' ]]; then
    # for grep to work properly
    unsetopt nomatch

    # refresh git index before reading it
    if [[ -O "$(git rev-parse --show-toplevel)/.git/index" ]]; then
      git update-index --really-refresh -q &> /dev/null;
    fi

    # prefix
    echo -n "%F{magenta}("

    # print branch name
    branch_name="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
      git rev-parse --short HEAD 2> /dev/null || \
      echo '(unknown)')";
    echo -n "$branch_name"

    # count staged files
    staged_count="$(git diff --name-status --staged | grep -v '^U' | wc -l | xargs)"
    if (( $staged_count != 0 )); then
      echo -n " Δ$staged_count"
    fi

    # count dirty files
    dirty_count="$(git diff --name-status | grep -v '^U' | wc -l | xargs)"
    if (( $dirty_count != 0 )); then
      echo -n " !$dirty_count"
    fi

    # count deleted files
    deleted_count="$(git diff --staged --name-status | grep '^U' | wc -l | xargs)"
    if (( $deleted_count != 0 )); then
      echo -n " X$deleted_count"
    fi

    # count untracked files
    untracked_count="$(git ls-files --others --exclude-standard | wc -l | xargs)"
    if (( $untracked_count != 0 )); then
      echo -n " ?$untracked_count"
    fi

    # get upstream state
    upstream_state="$(git rev-list --count --left-right $(git status -sb | head -n 1 | cut -d ' ' -f 2) | xargs)"

    # count commits ahead of upstream
    ahead_count="$(echo $upstream_state | cut -d ' ' -f 1)"
    if (( $ahead_count != 0 )); then
      echo -n " ↑$ahead_count"
    fi

    # count commits behind upstream
    behind_count="$(echo $upstream_state | cut -d ' ' -f 2)"
    if (( $behind_count != 0 )); then
      echo -n " ↓$behind_count"
    fi

    # suffix
    echo -n ")%f"

  fi

  # unset bold
  echo -n "%b"
}

# set prompt variables
export PROMPT='$(__set_prompt)'
export RPROMPT='$(__set_rprompt)'
export PS2="» "
