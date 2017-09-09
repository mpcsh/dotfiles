{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    /etc/nixos/hardware-configuration.nix

    # import base configuration
    ./dev.nix
    ./networking.nix
    ./nixpkgs.nix
    ./services.nix
    ./users.nix

    # import hostname-specific configuration
    ./boot.nix
    ./hostname.nix
  ];
}
