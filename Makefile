.PHONY: default sync base nixos nixpkgs xorg

# Modules
BASE_MODULES = git oh-my-zsh nvim ssh zsh
XORG_MODULES = bspwm firefox gtk termite xresources

default: sync base xorg

sync:
	peru sync

base:
	stow $(BASE_MODULES)

xorg:
	stow $(XORG_MODULES)
