SHELL := /usr/bin/env bash
.PHONY: default sync arch dev root-dev systemd xorg-base alpamayo annapurna eiger xyz csil

# Modules
ARCH_MODULES = pacman
DEV_MODULES = bash colors git nvim ssh tmux weechat
XORG_MODULES = bspwm termite

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

systemd:
	sudo systemctl enable --now $$PWD/systemd/*

xorg-base:
	stow $(XORG_MODULES)

# Bootstrapping rules
alpamayo: sync arch dev root-dev systemd xorg-base
	stow gtk-hidpi xresources-hidpi

annapurna: sync arch dev root-dev systemd xorg-base
	stow gtk-standard xresources-standard

eiger: sync arch dev root-dev systemd xorg-base
	stow gtk-standard xresources-standard

xyz: sync arch dev root-dev systemd

csil: csil-sync dev xorg-base
	stow gtk-standard xresources-standard
