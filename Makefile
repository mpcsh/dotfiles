SHELL := /usr/bin/env bash
.PHONY: sync dev xorg-base huascaran annapurna eiger xyz magneton

# Modules
DEV_MODULES = bash colors git nvim ssh tmux weechat
XORG_MODULES = bspwm roxterm

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
	stow gtk-hidpi xresources-hidpi

annapurna: sync arch dev root-dev systemd xorg-base
	stow gtk-standard xresources-standard

eiger: sync arch dev root-dev systemd xorg-base
	stow gtk-standard xresources-standard

xyz: sync arch dev root-dev systemd

csil: csil-sync dev xorg-base
	stow gtk-standard xresources-standard
