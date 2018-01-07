# source prezto
if [[ -e ~/.zprezto/init.zsh ]]; then
  source ~/.zprezto/init.zsh
fi

# source dotfiles
for f in $('ls' ~/.zsh/*.zsh); do
  source $f
done
