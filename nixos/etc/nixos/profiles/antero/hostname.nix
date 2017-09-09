{ config, pkgs, ...}:

{
  imports = [
    ./networking.nix
  ];

  networking.hostName = "antero";
}
