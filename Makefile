SHELL := /usr/bin/env bash
.PHONY: default sync dev nixos root-dev xorg-base alpamayo annapurna eiger xyz csil

# Modules
DEV_MODULES = bash colors git nvim ssh tmux weechat
NIXOS_MODULES = nixpkgs
XORG_MODULES = bspwm termite xresources

# Utilities
default:
	@echo 'Usage: make $$HOSTNAME'

sync:
	peru sync

# Modules
arch:
	sudo stow -t / $(ARCH_MODULES)

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

eiger: sync dev root-dev xorg-base
	stow gtk-standard

xyz: sync dev root-dev

csil: csil-sync dev xorg-base
	stow gtk-standard
