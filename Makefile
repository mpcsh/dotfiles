SHELL := /usr/bin/env bash
.PHONY: default sync base nixos root-base xorg-base alpamayo annapurna antero csil

# Modules
BASE_MODULES = bash colors git nvim ssh tmux weechat
NIXOS_MODULES = nixpkgs
XORG_MODULES = bspwm fonts termite xresources

# Utilities
default:
	@echo 'Usage: make $$HOSTNAME'

sync:
	peru sync

# Modules
base:
	stow $(BASE_MODULES)

nixos:
	stow $(NIXOS_MODULES)

root-base:
	sudo stow -t /root $(BASE_MODULES)

xorg-base:
	stow $(XORG_MODULES)

# Bootstrapping rules
alpamayo: sync base nixos root-base xorg-base
	stow gtk-hidpi

annapurna: sync base nixos root-base xorg-base
	stow gtk-standard

antero: sync base nixos root-base

csil: csil-sync base xorg-base
	stow gtk-standard
