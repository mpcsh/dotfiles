{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [ (import ./nixpkgs-mpcsh) ];

  nix.useSandbox = true;

  system.autoUpgrade = {
    enable = true;
    channel = https://nixos.org/channels/nixos-unstable;
    dates = "0/3:00:00"; # means "every hour divisible by 3, on the hour"
  };

  programs.command-not-found.enable = true;
}
