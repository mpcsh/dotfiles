# thefuck
if type -q thefuck
  thefuck --alias | source
end

# allows sudo to use aliases
function sudo
  command sudo -sE $argv
end

# better ls
function ls
  command ls -hF --color=auto $argv
end

function la
  ls -A $argv
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
function rcp
  command rsync -avzHE --progress -h $argv
end


# mkdir and cd into it
function mkcd
  command mkdir -p $argv
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
