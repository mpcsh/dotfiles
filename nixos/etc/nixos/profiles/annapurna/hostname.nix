{ config, pkgs, ...}:

{
  imports = [
    ./nvidia.nix
    ../../x.nix
  ];

  networking.hostName = "annapurna";
}
