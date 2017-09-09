{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  time.timeZone = "US/Eastern";

  environment.systemPackages = with pkgs; [
    inetutils
    networkmanagerapplet
    wirelesstools
  ];
}
