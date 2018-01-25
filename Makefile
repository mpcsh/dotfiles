SHELL := /usr/bin/env bash
.PHONY: default sync install clean

MODULES = fish git nvim ssh

default: install

sync:
	peru sync

install: sync
	stow $(MODULES)
	sudo stow -t /var/root $(MODULES)

clean:
	stow -D $(MODULES)
	sudo stow -D -t /var/root $(MODULES)
