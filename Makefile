.PHONY: default sync base root clean clean-base clean-root

# Modules
MODULES = fish git nvim ssh tmux

default: sync base base-root

sync:
	peru sync

base:
	stow $(MODULES)
	nvim -c "PlugInstall --sync" -c "qa"

base-root:
	sudo stow -t /var/root $(MODULES)
	sudo nvim -c "PlugInstall --sync" -c "qa"

clean: clean-base clean-root

clean-base:
	stow -D $(MODULES)

clean-root:
	sudo stow -t /var/root -D $(MODULES)
