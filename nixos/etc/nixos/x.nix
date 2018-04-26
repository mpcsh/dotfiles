{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # utils
    acpi
    arandr
    arc-theme
    arc-icon-theme
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
    rofi
    slop
    xrq
    xsel
    xorg.xbacklight
    xorg.xdpyinfo

    # apps
    discord
    firefox
    google-chrome
    gnome3.nautilus
    keybase-gui
    libreoffice
    maim
    mpv
    ranger
    slack
    spotify-new
    termite
    texlive.combined.scheme-full
    zathura
  ];

  fonts = {
    fonts = with pkgs; [
      mplus-outline-fonts
      font-awesome-ttf
      material-icons
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      cantarell_fonts
      corefonts
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [ "M+ 1mn" ];
        sansSerif = [ "Noto Sans" ];
        serif = [ "Noto Serif" ];
      };
    };
  };

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
      i3 = {
        enable = true;
        package = pkgs.i3-gaps;
      };
      default = "i3";
    };

    # disable default xterm desktop manager - otherwise it tries to start
    desktopManager = {
      xterm.enable = false;
      default = "none";
    };
  };

  # add i3 support to polybar
  nixpkgs.config = {
    packageOverrides = pkgs: rec {
      polybar = pkgs.polybar.override {
        i3GapsSupport = true;
      };
    };
  };

  services.compton = {
    enable = true;
    fade = true;
    fadeSteps = [ "0.03" "0.03" ];
    fadeDelta = 6;
    activeOpacity = "1.0";
    inactiveOpacity = "0.85";
    backend = "glx";
  };

  services.redshift = {
    enable = true;

    temperature = {
      day = 5500;
      night = 3300;
    };

    provider = "geoclue2";
  };
}
