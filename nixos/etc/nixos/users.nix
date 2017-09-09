{ config, pkgs, ... }:

security.sudo.wheelNeedsPassword = false;

users.defaultUserShell = pkgs.zsh;

programs.zsh.enable = true;

users.users.mpcsh = {
  isNormalUser = true; # sets group to users, createHome to true, home to /home/username, useDefaultShell to true, and isSystemUser to false
  extraGroups = [ "networkmanager" "wheel" ];
};
