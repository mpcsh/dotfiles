.PHONY: default sync install uninstall

# Modules
MODULES = fish git nvim tmux

default: sync install

sync:
	mkdir -p ~/.config/nvim/autoload
	curl -fLo ~/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 

install:
	stow --no-folding $(MODULES) -t ~
	nvim -c "PlugInstall --sync" -c "qa"
	@echo
	@echo "For iTerm2, make sure to:"
	@echo "- Manually load the preferences .plist through the preferences GUI"
	@echo "- Import the auto light / dark mode script through the Scripts menu"

uninstall:
	stow --no-folding -D $(MODULES) -t ~
