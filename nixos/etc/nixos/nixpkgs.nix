{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [ (import ./overlay) ];

  nix.useSandbox = true;

  system.autoUpgrade = {
    enable = true;
    channel = https://nixos.org/channels/nixos-unstable;
    dates = "0/1:00:00"; # means "every hour on the hour"
  };

  # run nix-collect-garbage automatically
  nix.gc = {
    automatic = true;
    dates = "0/1:00:00"; # means "every hour on the hour"
  };

  programs.command-not-found.enable = true;
}
