# thefuck
if type -q thefuck
  thefuck --alias | source
end

# allows sudo to use aliases
function sudo
  command sudo -sE $argv
end

# better ls
if type -q exa
  function ls
    command exa -1
  end
  function la
    command exa -1a
  end
  function ll
    command exa -l
  end
  function lla
    command exa -la
  end
else
  function ls
    command ls -1hF --color=auto
  end
  function la
    command ls -1hFA --color=auto
  end
  function ll
    command ls -lhF --color=auto
  end
  function lla
    command ls -lhFA --color=auto
  end
end

# because I like pain
function yay
  command yay --noconfirm $argv
end

# symlink by default
function ln
  command ln -s $argv
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

# typed racket
function racket
  command racket -I typed/racket $argv
end

# nvim
function vim
  command nvim $argv
end

# rsync options
function rsync
  command rsync -avzHE --progress -h $argv
end

# make SML repl work with arrow keys
function sml
  rlwrap sml -Cprint.depth=10000
end

# mkdir and cd into it
function mkcd
  mkdir -p $argv
  cd $argv
end

# cd .. repeatedly
function up
  cd (eval printf ../%.0s (seq 1 $argv))
end

# make CLI rg match fzf
function rg
  command rg --hidden --smart-case --glob !.git $argv
end

# ergodox firmware
function ergodox
  command teensy-loader-cli -mmcu=atmega32u4 -v -w $argv
end
