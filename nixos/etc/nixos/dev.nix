{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # utils
    ack
    exfat-utils
    fzf
    gist
    git
    gnumake
    htop
    neofetch
    neovim
    nix-prefetch-scripts
    peru
    psmisc
    rsync
    stow
    termite
    texlive.combined.scheme-full
    tmux
    usbutils
    weechat
    wget


    # languages
    ghc
    go
    hugo
    python
    python27Packages.pip
    python3
    python36Packages.pip
    rustup
    sass
  ];
}