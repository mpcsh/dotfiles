SHELL := /usr/bin/env bash
.PHONY: default sync install clean

# Modules
MODULES = git nvim ssh zsh

default: install

sync:
  peru sync

install: sync
  stow $(MODULES)
  sudo stow -t /var/root $(MODULES)

clean:
  stow -D $(MODULES)
  sudo stow -D -t /var/root $(MODULES)
