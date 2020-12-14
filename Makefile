.PHONY: default sync install uninstall

MODULES = fish git nvim tmux

default: sync install

sync:
	mkdir -p ~/.config/nvim/autoload
	curl -fLo ~/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 

install:
	stow --no-folding $(MODULES) -t ~
	nvim -c "PlugInstall --sync" -c "qa"
	nvim -c "LspInstall tsserver" -c "LspInstall vimls" -c "qa"
	# typescript has to be globally available for tsserver to work
	npm i -g typescript
	@echo
	@echo "For iTerm2, make sure to manually load the preferences .plist through the preferences GUI"
	@echo

uninstall:
	stow --no-folding -D $(MODULES) -t ~
