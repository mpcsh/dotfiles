# path to oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# disable oh-my-zsh's auto updater
DISABLE_AUTO_UPDATE="true"

# disable oh-my-zsh's ls aliases
DISABLE_LS_COLORS="true"

# load plugins
plugins=(git-prompt zsh-syntax-highlighting zsh-autosuggestions)

# load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# clear the default nixos zsh prompt
autoload -U promptinit && promptinit && prompt off

# source config files
for f in $(find ~/.zsh/*.zsh); do
	source $f
done
