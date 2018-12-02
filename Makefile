.PHONY: default sync base clean

# Modules
MODULES = fish git nvim ssh tmux

default: sync base base-root

sync:
	peru sync

base:
	stow $(MODULES)
	nvim -c "PlugInstall --sync" -c "qa"

clean:
	stow -D $(MODULES)
