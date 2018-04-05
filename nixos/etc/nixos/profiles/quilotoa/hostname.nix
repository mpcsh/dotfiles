{ config, pkgs, ...}:

{
  networking.hostName = "quilotoa";

  boot.loader.grub.device = "/dev/vda1";

  services.openssh = {
    enable = true;

    allowSFTP = false;
    permitRootLogin = "no";
    # passwordAuthentication = false;
  };

  # programs.openssh.authorizedKeys = [
  #   "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBN0bwb0WMMtmZ7Q16ECeq4RwW36OO5DqUCGvlzNx75/ mpcsh@millicent.local"
  # ];
}
