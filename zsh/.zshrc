###################################################
###################################################
#####                   ###########################
##### .zshrc / RESLOVED ###########################
#####                   ###########################
###################################################
###################################################

###### OHMYZSH ####################################

# PATH
export ZSH=~/.oh-my-zsh
plugins=(git git-prompt)
source $ZSH/oh-my-zsh.sh
source ~/.zsh/*.zsh

##### BINDS #######################################

# SUDO BIND (https://stackoverflow.com/a/970202)
# insert_sudo () { zle beginning-of-line; zle -U "sudo " }
# zle -N insert-sudo insert_sudo
# bindkey "^a" insert-sudo

# CLIMB BIND
# bindkey -s "^k" '^Ucd ..^M'
# DIR BIND
# bindkey -s "^l" '^Ule^M'

##### ALIAS #######################################

# SPACED DIR
# alias le="echo ''; ls; echo ''"
# SPACED NEO
# alias neo="clear; echo '\n'; neofetch"

##### PATH ######################################## 

# PYTHON
# export PYTHONPATH=/usr/lib/python3.6/site-packages
# JAVA
# export PATH=/usr/lib/jvm/java-10-jdk/bin/:$PATH

###################################################
##### end #########################################
###################################################

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
