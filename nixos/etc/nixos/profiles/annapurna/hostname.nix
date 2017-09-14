{ config, pkgs, ...}:

{
  imports = [
    ./boot.nix
    ./nvidia.nix
  ];

  networking.hostName = "annapurna";
}
