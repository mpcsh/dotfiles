{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  time.timeZone = "US/Central";

  environment.systemPackages = with pkgs; [
    inetutils
    networkmanagerapplet
    wirelesstools
  ];
}
