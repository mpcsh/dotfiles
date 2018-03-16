SHELL := /usr/bin/env bash
.PHONY: default sync install clean

MODULES = bspwm colors fish git gtk iosevka kitty nvim redshift ssh tmux weechat xresources

default: install

sync:
	peru sync

install: sync
	stow $(MODULES)
	sudo stow -t /root $(MODULES)

clean:
	stow -D $(MODULES)
	sudo stow -D -t /root $(MODULES)
