{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # utils
    autojump
    exfat-utils
    fzf
    gcc
    gist
    git
    gnumake
    gptfdisk
    hugo
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
    smlnj
    stow
    thefuck
    tldr
    usbutils
    weechat
    wget
    zip
    unzip
  ];
}
