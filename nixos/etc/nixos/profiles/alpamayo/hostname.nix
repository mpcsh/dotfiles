{ config, pkgs, ...}:

{
  imports = [
    ./trackpad.nix
    ../../x.nix
  ];

  networking.hostName = "alpamayo";
}
