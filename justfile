core_modules := "alacritty fish git nvim ssh tmux vscode"

core_packages := "asdf direnv fish fzf gh gist git-delta jq neofetch neovim nmap rlwrap rsync starship stow stylua tealdeer telnet tmux"
better_coreutils := "bat bottom eza fd gh hwatch just mosh ripgrep sd xh zoxide"

mac_packages := "trash"
mac_apps := "1password alfred appcleaner arc audio-hijack bartender contexts dash discord fantastical firefox fission google-chrome google-earth-pro iina iterm2 keyboard-maestro linearmouse logitech-g-hub loopback metaimage monitorcontrol moom mullvadvpn notion obsidian omnifocus postman qmk-toolbox rocket signal soulver soulver-cli soundsource spotify via visual-studio-code wireshark zoom"
mac_fonts := "font-caskaydia-cove-nerd-font font-fira-code-nerd-font font-iosevka-nerd-font font-mononoki-nerd-font font-mplus-nerd-font"

default: install

bootstrap: pkgs-init asdf-init install

pkgs-init:
	#!/usr/bin/env fish
	# this is a problem! fish won't be installed yet!
	if test (uname -sm) = "Darwin arm64"
		if ! type -q brew
			bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		end
		brew install {{core_packages}} {{better_coreutils}} {{mac_packages}}
		brew install --cask {{mac_apps}} {{mac_fonts}}
	end

asdf-init:
	#!/usr/bin/env fish
	asdf plugin add python
	asdf install python latest
	asdf plugin add nodejs
	asdf install nodejs latest

install:
	#!/usr/bin/env fish
	peru sync
	stow --no-folding -t ~ {{core_modules}}
	stow -t ~ external
	if type -q bat
		bat cache --build
	end
	echo
	echo "For iTerm2, make sure to manually load the preferences .plist through the preferences GUI"!

uninstall:
	#!/usr/bin/env fish
	stow --no-folding -t ~ -D {{core_modules}}
	stow -t ~ -D external
