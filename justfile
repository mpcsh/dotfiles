core_modules := "alacritty asdf atuin fish git nvim ssh starship tmux vscode"

brew_formulae := "atuin asdf bandwhich bat bottom direnv eza fd fish fzf gh gist git-delta htop hwatch jq just magic-wormhole mosh neofetch neovim nmap ouch pastel pidof ripgrep rlwrap rnr rsync sd starship stow tealdeer telnet tmux watchexec wget xh zoxide"

brew_casks := "1password alacritty alfred appcleaner audio-hijack chromium contexts fantastical firefox fission font-caskaydia-cove-nerd-font font-fira-code-nerd-font font-ia-writer-quattro font-iosevka-nerd-font font-mononoki-nerd-font font-m+-nerd-font iina iterm2 jordanbaird-ice keyboard-maestro linearmouse loopback monitorcontrol moom obsidian rocket soulver soulver-cli soundsource spotify visual-studio-code wireshark zen-browser zoom"

brew_cask_extras := "chirp discord garmin-express insta360-studio logitech-g-hub metaimage mullvadvpn notion omnifocus powerphotos signal via"

default:
	@echo just [bootstrap|install|install-extras|uninstall]

bootstrap: init-pkgs install-core init-asdf install-external

init-pkgs:
	#!/usr/bin/env sh
	if command -v brew > /dev/null 2>&1; then
		brew install {{brew_formulae}}
		brew install --cask {{brew_casks}}
	fi

init-asdf:
	#!/usr/bin/env fish
	if type -q asdf
		for lang in deno nodejs python
			asdf plugin add $lang
			asdf install $lang latest
			asdf global $lang latest
		end
	end

install: install-core install-external

install-core:
	#!/usr/bin/env fish
	stow --no-folding -t ~ {{core_modules}}
	echo
	echo "For iTerm2, make sure to manually load the preferences .plist through the preferences GUI"!

install-external:
	#!/usr/bin/env fish
	peru sync
	stow -t ~ external
	if type -q bat
		bat cache --build
	end

install-extras:
	#!/usr/bin/env fish
	brew install {{brew_cask_extras}}

uninstall:
	#!/usr/bin/env fish
	stow --no-folding -t ~ -D {{core_modules}}
	stow -t ~ -D external
