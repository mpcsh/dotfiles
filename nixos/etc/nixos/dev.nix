{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # utils
    autojump
    exfat-utils
    fzf
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
    usbutils
    weechat
    wget
    zip
    unzip

    # languages
    smlnj
  ];
}
