{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  time.timeZone = "US/Central";

  environment.systemPackages = with pkgs; [
    inetutils
    networkmanagerapplet
    wirelesstools
  ];

  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];
}
