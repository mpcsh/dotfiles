{ config, pkgs, ... }:

nixpkgs.config.allowUnfree = true;

nixpkgs.overlays = [ (import ./nixpkgs-mpcsh) ];

nix.useSandbox = true;

system.autoUpgrade = {
  enable = true;
  channel = https://nixos.org/channels/nixos-unstable;
};

programs.command-not-found.enable = true;
