{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];


  #######################
  ##### boot/kernel #####
  #######################
  boot.loader.grub = {
    # required for uefi
    device = "nodev";
    efiSupport = true;

    # winblows entry
    extraEntries = ''
      menuentry "Winblows 8.1" {
        insmod part_gpt
        insmod search_fs_uuid
        insmod chain
        search --fs-uuid --no-floppy --set=root 4023-cd4e
        chainloader ($root)/EFI/MICROSOFT/BOOT/bootmgfw.efi
      }
    '';
  };


  ######################
  ##### networking #####
  ######################

  networking = {
    hostName = "annapurna";
    networkmanager.enable = true;
  };

  time.timeZone = "US/Eastern";


  ###############################
  ##### nix/system packages #####
  ###############################

  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [ (import ./nixpkgs-mpcsh) ];

  nix.useSandbox = true;

  system.autoUpgrade = {
    enable = true;
    channel = https://nixos.org/channels/nixos-unstable;
  };

  environment.systemPackages = with pkgs; [
    ack
    acpi
    arc-theme
    arc-icon-theme
    chromium
    cmus
    dmenu2
    discord
    exfat-utils
    feh
    ffmpeg
    gist
    git
    gnome3.gnome_keyring
    gnumake
    go
    htop
    hugo
    i3lock
    imagemagick
    inetutils
    kbfs
    keybase
    keybase-gui
    minecraft
    maim
    mpv
    neofetch
    neovim
    networkmanagerapplet
    nix-prefetch-scripts
    pamixer
    pavucontrol
    peru
    polybar
    psmisc
    # todo: python
    ranger
    rsync
    sass
    slop
    spotify
    stow
    termite
    # todo: latex
    tmux
    usbutils
    weechat
    wget
    wirelesstools
    xclip
    xrq
    xfce.thunar
    xorg.xbacklight
    xorg.xdpyinfo
    zathura
  ];


  ####################
  ##### services #####
  ####################

  # disable firewall (on by default)
  networking.firewall.enable = false;

  # enable CUPS
  services.printing.enable = true;

  # syncthing
  services.syncthing = {
    enable = true;
    dataDir = "/home/mpcsh/.config/syncthing";
    group = "users";
    user = "mpcsh";
    useInotify = true;
  };

  # keybase, kbfs
  services.keybase.enable = true;
  services.kbfs = {
    enable = true;
    mountPoint = "/keybase";
  };

  services.unifi.enable = true;


  ####################
  ##### xorg env #####
  ####################

  services.xserver = {
    enable = true;

    videoDrivers = [ "nvidia" ];

    layout = "us";
    xkbOptions = "ctrl_alt_bksp:terminate, caps:escape";
    autoRepeatDelay = 250;

    displayManager.lightdm = {
      enable = true;
      autoLogin = {
        enable = true;
        user = "mpcsh";
      };
    };

    windowManager = {
      bspwm = {
        enable = true;
        package = pkgs.bspwm-unstable;
      };
      default = "bspwm";
    };

    # disable default xterm desktop manager - otherwise it tries to start
    desktopManager = {
      xterm.enable = false;
      default = "none";
    };
  };

  services.compton = {
    enable = true;
    fade = true;
    fadeSteps = [ "0.03" "0.03" ];
    fadeDelta = 6;
  };

  services.redshift = {
    enable = true;

    temperature = {
      day = 5500;
      night = 3300;
    };

    latitude = "35.95";
    longitude = "-78.95";
  };

  hardware.pulseaudio.enable = true;

  fonts.fonts = (with pkgs; [
    mplus-outline-fonts
    font-awesome-ttf
    material-icons
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ]);

  #################
  ##### users #####
  #################

  security.sudo.wheelNeedsPassword = false;

  users.users.mpcsh = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };


  ######################
  ##### nixos info #####
  ######################

  system.stateVersion = "17.09";
}
