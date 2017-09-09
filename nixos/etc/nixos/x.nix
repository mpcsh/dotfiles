{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # utils
    acpi
    adapta-gtk-theme
    arc-icon-theme
    dmenu2
    feh
    ffmpeg
    gnome3.dconf
    gnome3.gnome_keyring
    i3lock
    imagemagick
    kbfs
    keybase
    libnotify
    maim
    notify-osd
    pamixer
    pavucontrol
    polybar
    slop
    xclip
    xrq
    xorg.xbacklight
    xorg.xdpyinfo

    # apps
    chromium
    cmus
    discord
    gnome3.nautilus
    keybase-gui
    maim
    ranger
    spotify
  ];

  fonts.fonts = (with pkgs; [
    mplus-outline-fonts
    font-awesome-ttf
    material-icons
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ]);

  hardware.pulseaudio.enable = true;

  services.xserver = {
    enable = true;

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
}
