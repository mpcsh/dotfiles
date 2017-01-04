SHELL := /bin/bash
.PHONY: sync arch dev xorg-base huascaran annapurna eiger xyz magneton

DEV_MODULES = ack bash colors ghc git irssi nvim tmux

XORG_MODULES = admiral bspwm dunst input redshift termite xinitrc xmodmap

default:
	@echo 'Usage: make $$HOSTNAME'

sync:
	peru sync

arch:
	sudo stow -t / issue pacman; sudo bash -c "systemctl enable $$PWD/systemd/*.timer"

dev:
	stow $(DEV_MODULES)

root-dev:
	sudo stow -t /root $(DEV_MODULES)

xorg-base:
	stow $(XORG_MODULES)

huascaran: sync arch dev xorg-base root-dev
	stow bar-laptop gtk-hidpi xresources-hidpi

annapurna: sync arch dev xorg-base root-dev
	stow bar-desktop gtk-standard xresources-standard

eiger: sync arch dev xorg-base root-dev
	stow bar-laptop gtk-standard xresources-standard

xyz: sync arch dev root-dev

magneton: sync dev
