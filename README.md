# My sacred dotfiles
These dotfiles represent a few years' work towards making myself as comfortable
as possible on my Linux desktop. They are managed
[xero-style](http://blog.xero.nu/managing_dotfiles_with_gnu_stow), and aim to be
as flexible as possible - I use this repo on my desktop, laptop, personal
server, and university server (the last of which I don't even have root on).

## Installation dependencies
- GNU stow: for symlink management
- [peru](https://github.com/buildinspace/peru): to bootstrap other repositories

## Usage dependencies
- neovim, *not* vim
- tmux >= 1.9
- bspwm >= 0.9.2

## (n)vim plugins
See [peru.yaml](peru.yaml) for full reference. Here are my favorites:

- [vim-plug](https://github.com/junegunn/vim-plug): plugin management
- [vim-a](https://github.com/vim-scripts/a.vim): switch between `.c` and `.h`
	files with `:A`
- [vim-abolish](https://github.com/tpope/vim-abolish): advanced replacements
- [vim-commentary](https://github.com/tpope/vim-commentary): easy auto
	commenting
- [vim-easymotion](https://github.com/easymotion/vim-easymotion): jump anywhere
	in 4 keystrokes or fewer
- [vim-fugitive](https://github.com/tpope/vim-fugitive): easy git integration
- [vim-goyo](https://github.com/junegunn/goyo.vim): minimal writing view
- [vim-repeat](https://github.com/tpope/vim-repeat): let plugins use `.`
- [vim-surround](https://github.com/tpope/vim-surround): change delimiters
	easily
- [vim-tex](https://github.com/lervag/vimtex): live LaTeX (re)compiling
