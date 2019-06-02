.PHONY: default sync base xorg arch clean-base clean-xorg clean-arch clean

# Modules
MODULES = fish git nvim ssh
XORG_MODULES = alacritty bspwm fonts gtk rofi xresources
ARCH_MODULES = arch

default: sync base xorg arch

sync:
	peru sync

base:
	stow --no-folding $(MODULES)
	nvim -c "PlugInstall --sync" -c "qa"

xorg:
	stow --no-folding $(XORG_MODULES)

arch:
	sudo stow --no-folding -t / $(ARCH_MODULES)

clean-base:
	stow --no-folding -D $(MODULES)

clean-xorg:
	stow --no-folding -D $(XORG_MODULES)

clean-arch:
	sudo stow --no-folding -t / -D $(ARCH_MODULES)

clean: clean-base clean-xorg clean-arch
