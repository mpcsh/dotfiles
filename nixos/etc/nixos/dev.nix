{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # utils
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
    ripgrep
    rsync
    stow
    usbutils
    weechat
    wget
    zip
    unzip
  ];
}
