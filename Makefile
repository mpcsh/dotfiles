.PHONY: default sync install uninstall

# Modules
MODULES = fish git nvim tmux

default: sync install

sync:
	peru sync

install:
	stow --no-folding $(MODULES)
	nvim -c "PlugInstall --sync" -c "qa"

uninstall:
	stow --no-folding -D $(MODULES)
