# My sacred dotfiles
These dotfiles represent a few years' work towards making myself as comfortable
as possible on my Linux desktop. They are managed
[xero-style](http://blog.xero.nu/managing_dotfiles_with_gnu_stow), and aim to be
as flexible as possible - I use this repo on my desktop, laptop, personal
server, and university server (the last of which I don't even have root on).

## Installation dependencies
- GNU stow: for symlink management
- [peru](https://github.com/buildinspace/peru): to include other people's code

## Usage dependencies
- neovim, *not* vim
- tmux >= 1.9
- bspwm >= 0.9.2

## (n)vim plugins
Managed with [vim-plug](https://github.com/junegunn/vim-plug); see
[init.vim](nvim/.config/nvim/init.vim) for full reference.
