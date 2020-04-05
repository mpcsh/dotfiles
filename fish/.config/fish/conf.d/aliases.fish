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

# git
function g
  command git $argv
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
