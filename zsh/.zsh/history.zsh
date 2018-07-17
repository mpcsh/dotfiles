# https://unix.stackexchange.com/questions/273861/unlimited-history-in-zsh
HISTSIZE=10000000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history

# Don't treat the '!' character specially during expansion (e.g. in git commit)
unsetopt BANG_HIST

# don't record an entry that was just recorded again.
setopt HIST_IGNORE_DUPS

# do not display a line previously found.
setopt HIST_FIND_NO_DUPS

# don't write duplicate entries in the history file.
setopt HIST_SAVE_NO_DUPS

# don't execute immediately upon history expansion.
setopt HIST_VERIFY

# history sharing
setopt APPEND_HISTORY
setopt SHARE_HISTORY
