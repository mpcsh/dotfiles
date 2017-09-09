{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # import custom configuration
    ./networking.nix
  ];


  ###############################
  ##### nix/system packages #####
  ###############################

  environment.systemPackages = with pkgs; [
    ack
    acpi
    adapta-gtk-theme
    arc-icon-theme
    chromium
    cmus
    dmenu2
    discord
    exfat-utils
    feh
    ffmpeg
    fzf
    gist
    git
    gnome3.dconf
    gnome3.gnome_keyring
    gnome3.nautilus
    gnumake
    go
    htop
    hugo
    i3lock
    imagemagick
    kbfs
    keybase
    keybase-gui
    libnotify
    maim
    mpv
    neofetch
    neovim
    nix-prefetch-scripts
    notify-osd
    pamixer
    pavucontrol
    peru
    polybar
    psmisc
    python
    python27Packages.pip
    python3
    python36Packages.pip
    ranger
    rsync
    sass
    slop
    spotify
    stow
    termite
    texlive.combined.scheme-full
    tmux
    usbutils
    weechat
    wget
    wirelesstools
    xclip
    xrq
    xorg.xbacklight
    xorg.xdpyinfo
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

  # auto mounting
  services.gnome3.gvfs.enable = true;
  services.udisks2.enable = true;
  environment.variables = { GIO_EXTRA_MODULES = "${pkgs.gnome3.dconf}/lib/gio/modules:${pkgs.gvfs}/lib/gio/modules"; };

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

  ######################
  ##### nixos info #####
  ######################

  system.stateVersion = "17.09";
}
