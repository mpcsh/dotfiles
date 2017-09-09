{ config, pkgs, ...}:

{
  imports = [
    ./daemons.nix
  ];

  networking.hostName = "antero";
}
