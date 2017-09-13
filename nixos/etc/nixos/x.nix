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
    polybar-git
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
    mpv
    ranger
    spotify
    texlive.combined.scheme-full
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

  programs.chromium.extensions = [
    "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
    "gcbommkclmclpchllfjekcdonpmejbdp" # https everywhere
    "pkehgijcmpdhfbdbbnkijodmdjhbjlgp" # privacy badger
    "hdokiejnpimakedhajhdlcegeplioahd" # lastpass
    "bikioccmkafdpakkkcpdbppfkghcmihk" # signal
    "chlffgpmiacpedhhbkiomidkjlcfhogd" # pushbullet
    "ekopmclclddpoipchmcbhifohhbmjafd" # minimal scrollbar
    "laookkfknpbbblfpciffpaejjkokdgca" # momentum
  ];

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
