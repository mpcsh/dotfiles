# show all directories in prompt
set -x fish_prompt_pwd_dir_length 0

function fish_prompt
  # save exit status so it's not clobbered by successful commands below
  set -l exit_code $status
  set -l hostname_prefix ""
  set -l directory_prefix ""

  # if we're not who we logged in as, display the username
  if test $USER != "mpcsh"; and test $USER != "njw"
    set hostname_prefix "at "
    set directory_prefix "in "

    if test $USER = "root"
      set_color red
    else
      set_color green
    end
    printf "%s " $USER
    set_color normal
  end

  # if we're ssh'ed, display the hostname
  if test -n "$SSH_CONNECTION"
    set directory_prefix "in "

    printf "%s" $hostname_prefix
    set_color yellow
    printf "%s " (hostname)
    set_color normal
  end

  # print PWD
  printf "%s" $directory_prefix
  set_color blue
  printf "%s " (prompt_pwd)
  set_color normal

  # prompt char - red if previous command failed
  if test $exit_code -ne 0
    set_color red
  end
  printf "> "
  set_color normal
end

function fish_right_prompt
  # git status
  set_color purple
  printf "%s" (__fish_git_prompt)
  set_color normal
end
