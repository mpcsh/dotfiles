.PHONY: default sync base nixos nixpkgs xorg

# Modules
BASE_MODULES = colors git oh-my-zsh nvim ssh zsh
NIXOS_MODULES = nixos
NIXPKGS_MODULES = nixpkgs
XORG_MODULES = bspwm firefox gtk terminator xresources

default: sync base nixos nixpkgs xorg

sync:
	peru sync

base:
	stow $(BASE_MODULES)

bootstrap:
	stow -d nixos/etc/nixos/profiles -t nixos/etc/nixos $$INSTALL_HOST
	stow -t /mnt $(NIXOS_MODULES)

nixos:
	sudo stow -d nixos/etc/nixos/profiles -t nixos/etc/nixos $$(hostname)
	sudo stow -t / $(NIXOS_MODULES)

nixpkgs:
	stow $(NIXPKGS_MODULES)

xorg:
	stow $(XORG_MODULES)
