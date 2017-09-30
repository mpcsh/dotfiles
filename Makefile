SHELL := /usr/bin/env zsh
.PHONY: default sync install clean

# Modules
MODULES = atom git nvim oh-my-zsh ssh tmux weechat zsh

default: install

sync:
	peru sync

install: sync
	stow $(MODULES)
	sudo stow -t /var/root $(MODULES)

clean:
	stow -D $(MODULES)
	sudo stow -t /var/root $(MODULES)
