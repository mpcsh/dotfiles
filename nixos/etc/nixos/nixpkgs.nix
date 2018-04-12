{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [ (import ./overlay) ];

  nix.useSandbox = true;

  system.stateVersion = "unstable";
}
