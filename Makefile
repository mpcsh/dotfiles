SHELL := /bin/bash
.PHONY: sync arch dev xorg-base huascaran annapurna eiger xyz magneton

# Modules
DEV_MODULES = ack bash colors git irssi nvim ssh tmux
XORG_MODULES = admiral bspwm font redshift termite xinitrc xmodmap

# Utilities
default:
	@echo 'Usage: make $$HOSTNAME'

sync:
	peru sync

# Modules
arch:
	sudo stow -t / issue pacman

dev:
	stow $(DEV_MODULES)

root-dev:
	sudo stow -t /root $(DEV_MODULES)

systemd:
	sudo bash -c "systemctl enable $$PWD/systemd/*.timer"

xorg-base:
	stow $(XORG_MODULES)

# Bootstrapping rules
huascaran: sync arch dev root-dev systemd xorg-base
	stow bar-laptop gtk-hidpi xresources-hidpi

annapurna: sync arch dev root-dev systemd xorg-base
	stow bar-desktop gtk-standard xresources-standard

eiger: sync arch dev root-dev systemd xorg-base
	stow bar-laptop gtk-standard xresources-standard

xyz: sync arch dev root-dev systemd

magneton: sync dev xorg-base
	source venv/bin/activate; stow gtk-standard xresources-standard; deactivate
