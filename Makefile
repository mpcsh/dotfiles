SHELL := /usr/bin/env zsh
.PHONY: default sync base nixos nixpkgs root-base xorg-base alpamayo annapurna antero csil

# Modules
BASE_MODULES = bin colors git nvim oh-my-zsh ssh tmux weechat zsh
NIXOS_MODULES = nixos
NIXPKGS_MODULES = nixpkgs
XORG_MODULES = bspwm termite xresources

# Utilities
default:
	make $$HOST

sync:
	peru sync

# Modules
base:
	stow $(BASE_MODULES)

nixos:
	stow $(NIXPKGS_MODULES)

root-base:
	sudo stow -t /root $(BASE_MODULES)

xorg-base:
	stow $(XORG_MODULES)

# Bootstrapping rules
alpamayo: sync base nixos root-base xorg-base
	cd nixos/etc/nixos/profiles; stow $@
	sudo stow -t / $(NIXOS_MODULES)
	stow gtk-hidpi

annapurna: sync base nixos root-base xorg-base
	cd nixos/etc/nixos/profiles; stow $@
	sudo stow -t / $(NIXOS_MODULES)
	stow gtk-standard

antero: sync base nixos root-base
	cd nixos/etc/nixos/profiles; stow $@
	sudo stow -t / $(NIXOS_MODULES)

csil: csil-sync base xorg-base
	stow gtk-standard
