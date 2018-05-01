.PHONY: default sync base arch xorg

# Modules
ARCH_MODULES = arch
BASE_MODULES = fish git nvim ssh
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
