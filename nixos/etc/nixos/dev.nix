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
    tmux
    usbutils
    weechat
    wget
    z-git
    zip
    unzip


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
