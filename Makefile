SHELL := /usr/bin/env bash
.PHONY: default sync install clean

# Modules
MODULES = fish git nvim ssh

default: install

~/.config/fish/conf.d/omf.fish:
	curl -L https://get.oh-my.fish | fish
	omf install fish

sync: ~/.config/fish/conf.d/omf.fish
	peru sync

install: sync
	stow $(MODULES)
	sudo stow -t /var/root $(MODULES)

clean:
	stow -D $(MODULES)
	sudo stow -D -t /var/root $(MODULES)
