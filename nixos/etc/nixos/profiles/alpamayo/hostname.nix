{ config, pkgs, ...}:

{
  imports = [
    ./boot.nix
    ./trackpad.nix
  ];

  networking.hostName = "alpamayo";
}
