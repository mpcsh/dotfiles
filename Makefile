.PHONY: default sync base nixos nixpkgs xorg

# Modules
BASE_MODULES = colors fish git nvim ssh weechat
NIXOS_MODULES = nixos
NIXPKGS_MODULES = nixpkgs
XORG_MODULES = bspwm firefox gtk iosevka terminator xresources

default: sync base nixos nixpkgs xorg

# Utilities
sync:
	peru sync

# Modules
base:
	stow $(BASE_MODULES)

nixos:
	cd nixos/etc/nixos/profiles; stow $$(hostname)
	sudo stow -t / $(NIXOS_MODULES)

nixpkgs:
	stow $(NIXPKGS_MODULES)

xorg:
	stow $(XORG_MODULES)
