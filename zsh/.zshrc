# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# source config files
for f in $(ls ~/.zsh/*.zsh); do
	source $f
done

# load oh-my-zsh
source $ZSH/oh-my-zsh.sh
