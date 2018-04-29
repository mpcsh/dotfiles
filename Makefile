.PHONY: default sync base nixos nixpkgs xorg

# Modules
ARCH_MODULES = pacman
BASE_MODULES = git oh-my-zsh nvim ssh zsh
XORG_MODULES = bspwm firefox gtk termite xresources

default: sync base arch xorg

sync:
	peru sync

base:
	stow $(BASE_MODULES)

arch:
	sudo stow -t / $(ARCH_MODULES)

xorg:
	stow $(XORG_MODULES)
