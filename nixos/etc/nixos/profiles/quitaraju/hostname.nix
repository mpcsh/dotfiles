{ config, pkgs, ...}:

{
  networking.hostName = "quitaraju";

  hardware.cpu.intel.updateMicrocode = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;

  # CPU frequency
  powerManagement.cpuFreqGovernor = "powersave";

  services.xserver.libinput = {
    enable = true;

    accelProfile = "flat";
    tappingDragLock = false;
    tapping = false;
  };
}
