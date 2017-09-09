{ config, pkgs, ... }:

imports = [
  # import hostname from the script
  ./hostname.nix
];

networking.networkmanager.enable = true;
time.timeZone = "US/Eastern";

environment.systemPackages = with pkgs; [
  inetutils
  networkmanagerapplet
];
