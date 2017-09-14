{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dropbox
  ];

  # CUPS
  services.printing.enable = true;

  networking.firewall.enable = false;

  services.keybase.enable = true;
  services.kbfs = {
    enable = true;
    mountPoint = "/keybase";
  };

  # auto mounting
  services.gnome3.gvfs.enable = true;
  services.udisks2.enable = true;
  environment.variables = { GIO_EXTRA_MODULES = "${pkgs.gnome3.dconf}/lib/gio/modules:${pkgs.gvfs}/lib/gio/modules"; };
}
