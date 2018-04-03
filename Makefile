.PHONY: default sync base nixos nixpkgs xorg

# Modules
BASE_MODULES = colors fish git nvim ssh weechat
NIXOS_MODULES = nixos
NIXPKGS_MODULES = nixpkgs
XORG_MODULES = bspwm firefox gtk iosevka terminator xresources

default: sync base nixos nixpkgs xorg

sync:
	peru sync

base:
	stow $(BASE_MODULES)

bootstrap:
	stow -t /mnt $(NIXOS_MODULES)

nixos:
	sudo stow -d nixos/etc/nixos/profiles -t / $$(hostname)
	sudo stow -t / $(NIXOS_MODULES)

nixpkgs:
	stow $(NIXPKGS_MODULES)

xorg:
	stow $(XORG_MODULES)
