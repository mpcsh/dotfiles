#!/usr/bin/env sh

if [ "$(uname -sm)" = "Darwin arm64" ]; then
	if ! command -v brew > /dev/null 2>&1; then
		bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		eval "$(/opt/homebrew/bin/brew shellenv)"
	fi

	if ! command -v just > /dev/null 2>&1; then
		brew install just
	fi
	just bootstrap
fi
