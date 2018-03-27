SHELL := /usr/bin/env bash
.PHONY: default sync install clean

MODULES = bspwm colors fish firefox git gtk iosevka nvim redshift ssh terminator weechat xresources

default: install

sync:
	peru sync

install: sync
	stow $(MODULES)
	sudo stow -t /root $(MODULES)

clean:
	stow -D $(MODULES)
	sudo stow -D -t /root $(MODULES)
