SHELL := /usr/bin/env zsh
.PHONY: default sync install clean

# Modules
MODULES = atom fish git nvim ssh

default: install

sync:
	peru sync

install: sync
	stow $(MODULES)
	sudo stow -t /var/root $(MODULES)

clean:
	stow -D $(MODULES)
	sudo stow -D -t /var/root $(MODULES)
