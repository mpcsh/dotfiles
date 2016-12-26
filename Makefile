SHELL := /bin/bash
.PHONY: sync arch dev xorg-base huascaran annapurna eiger xyz magneton

default:
	@echo 'Usage: make $$HOSTNAME'

sync:
	peru sync

arch:
	stow ack irssi; sudo stow -t / issue pacman; sudo bash -c "systemctl enable $$PWD/systemd/*"

dev:
	stow bash colors ghc git nvim tmux

xorg-base:
	stow admiral bspwm colors dunst input redshift termite xinitrc xmodmap

huascaran: sync arch dev xorg-base
	stow bar-laptop gtk-hidpi xresources-hidpi

annapurna: sync arch dev xorg-base
	stow bar-desktop gtk-standard xresources-standard

eiger: sync arch dev xorg-base
	stow bar-laptop gtk-standard xresources-standard

xyz: sync arch dev

magneton: sync dev
