# thefuck
if which thefuck > /dev/null
  thefuck --alias | source
end

# allows sudo to use aliases
function sudo
  command sudo -sE $argv
end

# better ls
function ls
  switch (uname)
  case Darwin
    command ls -lhFG $argv
  case Linux
    command ls -lhF --color=auto $argv
  end
end

function la
  switch (uname)
  case Darwin
    command ls -lhFGA $argv
  case Linux
    command ls -lhFA --color=auto $argv
  end
end

# because I like pain
function yay
  yay --noconfirm $argv
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
