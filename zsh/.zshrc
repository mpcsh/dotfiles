# load antigen
source .zsh/antigen/antigen.zsh

# load plugins
antigen bundle olivierverdier/zsh-git-prompt
antigen bundle zsh-users/zsh-autosuggestions

# syntax highlighting must come last
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

# source config files
for f in $(ls ~/.zsh/*.zsh); do
  source $f
done
