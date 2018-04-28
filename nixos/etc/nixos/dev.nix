{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # utils
    autojump
    exfat-utils
    fzf
    hugo
    gist
    git
    gnumake
    gptfdisk
    htop
    neofetch
    neovim
    python27Packages.neovim
    python36Packages.neovim
    neovim-remote
    nix-prefetch-scripts
    peru
    psmisc
    ripgrep
    rlwrap
    rsync
    stow
    thefuck
    tldr
    tmux
    tree
    usbutils
    weechat
    wget
    zip
    unzip

    # languages
    gcc
    ghc
    python2
    python3
    rustup
    smlnj
    texlive.combined.scheme-full
  ];
}
