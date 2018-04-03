{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # import base configuration
    ./dev.nix
    ./networking.nix
    ./nixpkgs.nix
    ./services.nix
    ./users.nix
    ./x.nix

    # import hostname-specific configuration
    ./hostname.nix
  ];
}
