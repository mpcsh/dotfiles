.PHONY: default sync install uninstall

MODULES = fish git nvim tmux

default: sync install

sync:
	mkdir -p ~/.config/nvim/autoload
	curl -fLo ~/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 

install:
	stow --no-folding $(MODULES) -t ~
	nvim -c "PlugInstall --sync" -c "qa"
	@echo
	@echo "For iTerm2, make sure to manually load the preferences .plist through the preferences GUI"

uninstall:
	stow --no-folding -D $(MODULES) -t ~
