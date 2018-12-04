.PHONY: default sync base clean

# Modules
MODULES = fish git nvim ssh tmux

default: sync base

sync:
	peru sync

base:
	stow --no-folding $(MODULES)
	nvim -c "PlugInstall --sync" -c "qa"

clean:
	stow --no-folding -D $(MODULES)
