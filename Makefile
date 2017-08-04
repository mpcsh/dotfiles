SHELL := /usr/bin/env bash
.PHONY: default sync arch dev root-dev systemd xorg-base alpamayo annapurna eiger xyz csil

# Modules
DEV_MODULES = bash colors git nvim ssh tmux weechat
XORG_MODULES = bspwm termite xresources

# Utilities
default:
	@echo 'Usage: make $$HOSTNAME'

sync:
	peru sync

# Modules
dev:
	stow $(DEV_MODULES)

root-dev:
	sudo stow -t /root $(DEV_MODULES)

xorg-base:
	stow $(XORG_MODULES)

# Bootstrapping rules
alpamayo: sync dev root-dev xorg-base
	stow gtk-hidpi

annapurna: sync dev root-dev xorg-base
	stow gtk-standard

eiger: sync arch dev root-dev systemd xorg-base
	stow gtk-standard

xyz: sync arch dev root-dev systemd

csil: csil-sync dev xorg-base
	stow gtk-standard
