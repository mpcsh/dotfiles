# allows sudo to use aliases
function sudo
	command sudo $argv
end


# better ls
function ls
	command ls -lhFG $argv
end

function la
	command ls -lhFGA $argv
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
	command rm -r $argv
end

function mkdir
	command mkdir -p $argv
end


# shred and delete
function shred
	command shred --remove $argv
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
	command rsync -avzHE $argv
end


# mkdir and cd into it
function mkcd
	command mkdir -p $argv
	command cd $argv
end


# cd .. repeatedly
function up
	cd (eval printf ../%.0s (seq $argv))
end
