.PHONY: default install uninstall

MODULES = fish git nvim ssh vscode

default: install

install:
	stow --no-folding $(MODULES) -t ~
	@echo
	@echo "For iTerm2, make sure to manually load the preferences .plist through the preferences GUI"
	@echo

uninstall:
	stow --no-folding -D $(MODULES) -t ~
