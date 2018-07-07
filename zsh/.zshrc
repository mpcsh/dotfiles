# load antigen
source ~/.zsh/antigen/antigen.zsh

# autojump
antigen bundle rupa/z

# fish-like command suggestions
antigen bundle zsh-users/zsh-autosuggestions

# syntax highlighting must come last
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

# source config files
for f in $(ls ~/.zsh/*.zsh); do
  source $f
done

# start up tmux if we're not in it
if [ $(hostname) = "cpair" ] && [ -z $TMUX ]; then
  export GIT_DUET_CO_AUTHORED_BY=1
  tmuxp load -y ~/.tmux/sessions/$('ls' -1 ~/.tmux/sessions | sed 's/\.yaml//' | fzf -1 --reverse).yaml
fi
