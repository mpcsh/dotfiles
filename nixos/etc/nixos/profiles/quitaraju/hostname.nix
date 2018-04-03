{ config, pkgs, ...}:

{
  networking.hostName = "quitaraju";

  hardware.cpu.intel.updateMicrocode = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;

  services.xserver.libinput = {
    enable = true;

    accelProfile = "flat";
    # buttonMapping = "1 3 2";
    # clickMethod = "clickfinger";
    # disableWhileTyping = true;
    # middleEmulation = false;
    tappingDragLock = false;
    tapping = false;
  };
  # services.xserver.synaptics = rec {
  #   enable = true;
  #   accelFactor = "0";
  #   additionalOptions = ''Option "CoastingSpeed" "0"'';
  #   buttonsMap = [ 1 3 2 ];
  #   horizEdgeScroll = false;
  #   maxSpeed = "0.8";
  #   minSpeed = maxSpeed;
  #   palmDetect = true;
  #   tapButtons = false;
  #   twoFingerScroll = true;
  #   vertEdgeScroll = false;
  # };
}
