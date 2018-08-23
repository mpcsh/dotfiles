.PHONY: default sync base arch xorg clean clean-base clean-arch clean-xorg

# Modules
ARCH_MODULES = arch
BASE_MODULES = git nvim ssh tmux zsh
XORG_MODULES = bspwm firefox fonts gtk kitty xresources

default: sync base base-root arch xorg
headless: sync base base-root arch
permissionless: sync base

sync:
	peru sync

base:
	stow $(BASE_MODULES)
	nvim -c "PlugInstall --sync" -c "qa"

base-root:
	sudo stow -t /root $(BASE_MODULES)

arch:
	sudo stow -t / $(ARCH_MODULES)

xorg:
	stow $(XORG_MODULES)

clean: clean-base clean-root clean-arch clean-xorg

clean-base:
	stow -D $(BASE_MODULES)

clean-root:
	sudo stow -t /root -D $(BASE_MODULES)

clean-arch:
	sudo stow -t / -D $(ARCH_MODULES)

clean-xorg:
	stow -D $(XORG_MODULES)
