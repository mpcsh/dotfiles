###########
# coreutils
###########

# allows sudo to use aliases
function sudo
  command sudo -sE $argv
end

# better ls
if type -q exa
  function ls
    command exa -1 $argv
  end
  function la
    command exa -1a $argv
  end
  function ll
    command exa -lg $argv
  end
  function lla
    command exa -lga $argv
  end
else
  function ls
    command ls -1hF --color=auto $argv
  end
  function la
    command ls -1hFA --color=auto $argv
  end
  function ll
    command ls -lhF --color=auto $argv
  end
  function lla
    command ls -lhFA --color=auto $argv
  end
end

# work on directories
function cp
  command cp -r $argv
end

function rm
  command rm -rf $argv
end

function mkdir
  command mkdir -p $argv
end

# symlink by default
function ln
  command ln -s $argv
end

# rsync options
function rsync
  command rsync -avzHE --progress -h $argv
end

######################
# default replacements
######################

# make CLI rg match fzf
function rg
  command rg --hidden --smart-case --glob !.git $argv
end

# nvim
function vim
  command nvim $argv
end

# typed racket
function racket
  command racket -I typed/racket $argv
end

# make SML repl work with arrow keys
function sml
  rlwrap sml -Cprint.depth=10000
end

#########################
# custom functions & misc
#########################

# mkdir and cd into it
function mkcd
  mkdir -p $argv
  cd $argv
end

# cd .. repeatedly
function up
  cd (eval printf ../%.0s (seq 1 $argv))
end

# thefuck
if type -q thefuck
  thefuck --alias | source
end

# ergodox firmware
function ergodox
  command teensy-loader-cli -mmcu=atmega32u4 -v -w $argv
end

function pair-with
  set pair (echo $argv (whoami) | tr " " "\n" | sort | head -c -1 | tr '\n' ',')
  set session_file "/shared/$pair/tmux.session"
  # echo $session_file
  tmux -S "$session_file" attach -t pair; or tmux -S "$session_file" new -t pair
  chgrp hackers "$session_file"; or echo "Couldn't change group of session file!"
end
