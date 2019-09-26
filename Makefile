.PHONY: default sync install uninstall

# Modules
MODULES = fish git nvim tmux

default: sync install

sync:
	curl -fLo nvim/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 

install:
	stow --no-folding $(MODULES)
	nvim -c "PlugInstall --sync" -c "qa"

uninstall:
	stow --no-folding -D $(MODULES)
