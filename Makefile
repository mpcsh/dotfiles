.PHONY: default sync base arch xorg clean clean-base clean-arch clean-xorg

# Modules
ARCH_MODULES = arch
BASE_MODULES = git nvim ssh tmux zsh
XORG_MODULES = alacritty bspwm firefox gtk xresources

default: sync base arch xorg

sync:
	peru sync

base:
	stow $(BASE_MODULES)
	sudo stow -t /root $(BASE_MODULES)

arch:
	sudo stow -t / $(ARCH_MODULES)

xorg:
	stow $(XORG_MODULES)

clean: clean-base clean-arch clean-xorg

clean-base:
	stow -D $(BASE_MODULES)
	sudo stow -t /root -D $(BASE_MODULES)

clean-arch:
	sudo stow -t / -D $(ARCH_MODULES)

clean-xorg:
	stow -D $(XORG_MODULES)
